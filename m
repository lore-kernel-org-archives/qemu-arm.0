Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563BACCF2DD
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 15:40:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viDqD-0002oT-EN; Tue, 20 Jan 2026 10:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1viDq6-0002jz-Fg
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 10:40:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1viDq4-0000xu-LX
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 10:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768923615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kFaEoJOo9PLnfQoHC++Vr7BRDm+IJPN9NLdi1in5Kr4=;
 b=TAkluD3NCLAPnmJ/xXbaja6QvdyWC7Pj5+py7kB8aR9OE+k0282G0vhRoOZXoEOs3SAtyP
 pXmDDoUa2bMSpUbmEdWUrce7zQiT3G9yyoq/bbfVYNbeT2fVxqIbOOLq6dAN29citR95Dv
 Xp8y/hhx819VBygus36ApqBbw3M16LY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-FHrWXejfM_adj0WUR9CT9Q-1; Tue, 20 Jan 2026 10:40:11 -0500
X-MC-Unique: FHrWXejfM_adj0WUR9CT9Q-1
X-Mimecast-MFC-AGG-ID: FHrWXejfM_adj0WUR9CT9Q_1768923611
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4803b4e3b9eso15408925e9.3
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 07:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768923611; x=1769528411;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kFaEoJOo9PLnfQoHC++Vr7BRDm+IJPN9NLdi1in5Kr4=;
 b=IbJeyLabjx0uLdzpP9u0iiJD0XfUP+gmKHrptPgYg6A5GKPGrweiZ2c4Z3M/j6MxcC
 q/Nszpw0BN8hk7KOMfKsH2z+LzZGN2SpBjfKGTDNvVUTka/vHjUXAj/8I1GZMoYwZ9xO
 xadbaHES/QmEfsDtIIrikBGcx3hYn1SDxX/BgabofUecLQ96qp9XLksDWLNJ8dPUpifJ
 FA3o41xK9aH+hjjZvD3cqUUtaeIk64M18TVqrfiU9gM6396TJwNqO7yG2Te/xYTpi9En
 wd9w7llHaS3+a3ywGXN44HWpSejGsrxEqngVgBYD8QR+O7/oOU83WNhBQyhnXO32IPTo
 ICLA==
X-Gm-Message-State: AOJu0YxkUxDYYqrn4qfL6U38knllI6eNGtyeuH0kmJYOfkzVxdsPPld7
 jTl6DbiwT2CRKXKa8RUl0H5VwuuDR6gedRlDD4ZIyaU+sBx/lWHj9a9GT6zrfWYec/VroRuQY7Z
 3UJ8rBF7NtDParSnxDpuP4h8dhUqiH/UjwMMgfxzxlxVDseaImNv+5A==
X-Gm-Gg: AY/fxX4dFCtLz49LkvpmEBNDgycnXQf2FkF7mt7DE3t91QVh80zb7BObGm2EfGP6VdT
 0ZCIYgiHy+h4rt7OqtnkAeoQP28tBrH2FIIYYxSN2xXAVFvj+kIDPYmuqhp9mrgz4eMrLNNBapn
 I0I9VBnDHXUOKgxp3JaONwgWT4pT78rvNXyFsyDdaj21H542/+N0dS3S2NKG0Ib7vHJZ8Ge/DM4
 ICzXqKJYYgicioD+3OxRDZd/jzvvSaykgp7RTucoRkCXbl2Q0QIpF2hRNhYyaf6/LZl6+DsQhVF
 ZnbgE1dAuMbT5RB2AiuuLuj0k07506jvln/vOkmKFH1khCum9nxFz0NUwtxv1GSJ2DFX2wJE3a6
 SzEvy2REBuoSwzPx74KEP3HsAsVWUPVG5L0pMxpCwLRW3xb3EbHeTt1Wzpxs=
X-Received: by 2002:a05:600c:46ce:b0:477:7b16:5f9f with SMTP id
 5b1f17b1804b1-4801eb0efe0mr209213715e9.31.1768923610701; 
 Tue, 20 Jan 2026 07:40:10 -0800 (PST)
X-Received: by 2002:a05:600c:46ce:b0:477:7b16:5f9f with SMTP id
 5b1f17b1804b1-4801eb0efe0mr209213185e9.31.1768923610266; 
 Tue, 20 Jan 2026 07:40:10 -0800 (PST)
Received: from rh (p200300f6af31d00062ddfb9151537832.dip0.t-ipconnect.de.
 [2003:f6:af31:d000:62dd:fb91:5153:7832])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fd3bcd2sm117566025e9.1.2026.01.20.07.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 07:40:09 -0800 (PST)
Date: Tue, 20 Jan 2026 16:40:08 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH RFC 0/3] arm: demuxed ID registers (CCSIDR_EL1)
In-Reply-To: <20260119172732.140613-1-cohuck@redhat.com>
Message-ID: <b64a662e-4403-c21a-249e-c2b99a1f980c@redhat.com>
References: <20260119172732.140613-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: efsO8xpQrNqGs33w-bT1wH9sMQIub_o6JynlDfIbKq4_1768923611
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.087,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 19 Jan 2026, Cornelia Huck wrote:
> Note: this is on top of <20260105154119.59853-1-cohuck@redhat.com>
> ("[PATCH v3 0/2] arm: move DCZID_EL0 to idregs array")
>
> While trying to move to an autogenerated cpu-sysregs.h.inc (so that we
> may keep a common view on registers), we should first address the ID
> registers that are still kept outside of ARMISARegisters. Other than
> DCZID_EL0 (addressed by the series this one goes on top of), that's
> the CCSIDR_EL1 values kept in cpu->cssidr[] (indexed via CSSELR_EL1.)
>
> My idea was to provide {GET,SET}_IDREG_DEMUX helper that work similar
> to {GET,SET}_IDREG and operate on a two-dimensional array. As a side
> effect, this also allows to get the values KVM provides for CCSIDR_EL1
> (which are virtualized as well.)
>
> RFC because there are still some open questions:
> - The demux array cannot easily be autogenerated. We can get rid of the
>  ccsidr[] array, but we now have an autogenerated entry in the non-demux
>  array that does nothing. Both are not that nice.
> - I'm not sure if we need any compat handling for KVM (on TCG, everything
>  should stay the same.) In theory, the KVM interface allows setting
>  values from userspace (I didn't try.)
> - There's a slight disagreement between the current code (providing 16
>  entries for CCSIDR_EL1) and the KVM code (providing (7 cache levels) *
>  (data/unified, instruction) = 14 entries.) With FEAT_MTE2, we might be
>  needing 7 more entries.
>

LGTM!

Reviewed-by: Sebastian Ott <sebott@redhat.com>

Thanks,
Sebastian


