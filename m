Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3890FEFCE21
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Mar 2026 17:13:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxpmO-0004sT-Fi; Wed, 04 Mar 2026 12:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vxpmN-0004rv-16
 for qemu-arm@nongnu.org; Wed, 04 Mar 2026 12:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vxpmL-0007wR-4U
 for qemu-arm@nongnu.org; Wed, 04 Mar 2026 12:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772644375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pPVdzIIePuK+F2R5oJ7gn/ShMMHO/lKUzbK9XmaCfmA=;
 b=Ouv2rWj4khk3nLWIggajVGVChX92GluFORyRhOTt6qHTqAUf7mvS+vk8uYqchK8pO9YrPv
 u0mp//2JcPUoljbijpIMJa1GACrmXkG2T+11SI15r4pzWhvtCKi9bAxfEC8z0Ti2DD1lQS
 hDgMWWOZj7vEgI0TQrGa4EzewvY7mmw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-Tb1a4KkpM6i5Vgm3tWzvSQ-1; Wed, 04 Mar 2026 12:12:52 -0500
X-MC-Unique: Tb1a4KkpM6i5Vgm3tWzvSQ-1
X-Mimecast-MFC-AGG-ID: Tb1a4KkpM6i5Vgm3tWzvSQ_1772644371
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-439ca4b3d0bso491109f8f.3
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2026 09:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772644371; x=1773249171;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pPVdzIIePuK+F2R5oJ7gn/ShMMHO/lKUzbK9XmaCfmA=;
 b=ok+Lyan7ZW1P0NoVRjApwdwIKTz16s6Wv2rke2rWP3BcjW7FxaAIAph3jGUj4zaKjQ
 mScfPFlzcZRJefVal7zzcjN86suXsfio6tzowDDGJ9D2eXHBAzbUw+hxlVR3hSH084mG
 16bFSMVO9WVr6upS3dZeCM6xGZ0PfD2DR9HzKB0N7DI0UvucrRkAj+aGYGYbm5/tD1Dt
 LxHM22ISV/vPS9ll+p5OInj9s2qSlBEPKQviRvJ/AgXN5ZE6S3KqBIO7KJYUD/Odd7LC
 TggDwH754PngezGARW957F/jPpx5LXMYtMn4/ms2NIjyDRhO4LUmstDyRBzfCIqSYnCu
 BUyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvHZiFS+bKyzoMdf6SYgPCPXg+Dy52PHyIQCzwJukpkJTYe8MqLZsJE2kvPhb11Qo9J/guibrefw==@nongnu.org
X-Gm-Message-State: AOJu0Yy3b8lqSbz+ZHvDh9BStWCjXNUyzEgEb7CeKXUsQ4WM9djnGCIY
 MxYcFXiXmW84PS9ctfwV53REckY5t1wT6eeaVVn6IZA5jmAcD2MiTta/gKnMQhDB53j1msZw9rn
 jHsQRaBKxd54eU0XI/TrNpwbMGLoj8NIe+ZJT2aVWknbPDHpj/L26Rg==
X-Gm-Gg: ATEYQzy0mYgnUHq5chGT8yu4pyXbeDqVSvtKXs6RAed+rPG6jWaYwBiLZkTTVhZ+qf3
 gTN86Y3nai/VcNDd8ctA6Q2oBt247TYlT23/6p0k6LQbR2PgkR4slvQg4i+QMvCiUUGuEV+GPSg
 U5W5utfKzQTRNvftssCcLg8p1iUe3KFi+lFdkTLrFtDtUrDJyiOxWAHgCKrhlJnP8aWr9FPixj+
 U/AECz5dcSKxurSgQsdwI4EwX1K2Nrb5hacqf/mQ1jyusw7sGEhBuKALWbK2Ec52mldDVp0b5JW
 PSqOi+Ik38A+7krMexOrF5pZGLCIjICO6LW/siFrui0e856hHj6ecYz9mEW5B0cncaZNXvv18aL
 DlmV4K8nnhZcmkNAkUS1dnwhg+Fds+gasnilaLTIkpXq61eTmiRbU4KIZdA9fhGkfzvrP
X-Received: by 2002:a05:6000:26c7:b0:432:8504:8d5b with SMTP id
 ffacd0b85a97d-439c7fe6711mr5293792f8f.50.1772644370618; 
 Wed, 04 Mar 2026 09:12:50 -0800 (PST)
X-Received: by 2002:a05:6000:26c7:b0:432:8504:8d5b with SMTP id
 ffacd0b85a97d-439c7fe6711mr5293739f8f.50.1772644370109; 
 Wed, 04 Mar 2026 09:12:50 -0800 (PST)
Received: from rh (p200300f6af4a490003d6f56739ca055c.dip0.t-ipconnect.de.
 [2003:f6:af4a:4900:3d6:f567:39ca:55c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b41831easm27950931f8f.12.2026.03.04.09.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 09:12:49 -0800 (PST)
Date: Wed, 4 Mar 2026 18:12:48 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, peterx@redhat.com, 
 philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v7 1/7] target/arm/machine: Fix detection of unknown
 incoming cpregs
In-Reply-To: <20260302103640.1362564-2-eric.auger@redhat.com>
Message-ID: <e4025976-9200-8419-d533-8076de0174d5@redhat.com>
References: <20260302103640.1362564-1-eric.auger@redhat.com>
 <20260302103640.1362564-2-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QhqqjNW1PXwGpXUo3Rkr3ioPJBscNt100atN5DhGYJU_1772644371
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.703, RCVD_IN_VALIDITY_SAFE_BLOCKED=1.386,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 2 Mar 2026, Eric Auger wrote:
> Currently the check of cpreg index matches fail to detect
> a situation where the length of both arrays is same but
> - destination has an extra register not found in the incoming stream (idx1)
> - source has an extra register not found in the destination (idx2)
>  where idx1 < = idx2
> Normally this should fail but it does not.
>
> Fix the logic to scan all indexes.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: 721fae12536 ("target-arm: Convert TCG to using (index,value) list for cp migration")


Reviewed-by: Sebastian Ott <sebott@redhat.com>


