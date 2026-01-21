Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556B5C44536
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 14:55:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viZWH-0007uN-35; Wed, 21 Jan 2026 09:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1viZVX-0007Di-IP
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 09:48:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1viZVV-0004ds-9a
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 09:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769006905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d1yEq8agaiClEjvop9wIX9ws+n9IYQVnAS+x1GnNwE0=;
 b=QZxuuCBLkSxvI3uj32FC9wDCBsSaWlb2Qabq4ggBNaaO7o9Q6/itCf7XY9DxvgwmnAgGS4
 ChYN1kH8VNZTSNvCGmkSGX8sQi5LNjU3Ilw/0dvrsUoiyzdl6RSDcvaP1Z7U6tT+fIqhOi
 EtJaJjZ1w1J4snLUarGRIc9UGNh/kqY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-uuX5bSZSPFaQUfVopUoEyw-1; Wed, 21 Jan 2026 09:48:23 -0500
X-MC-Unique: uuX5bSZSPFaQUfVopUoEyw-1
X-Mimecast-MFC-AGG-ID: uuX5bSZSPFaQUfVopUoEyw_1769006903
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-435a0fb0c9cso496446f8f.0
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 06:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769006902; x=1769611702;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d1yEq8agaiClEjvop9wIX9ws+n9IYQVnAS+x1GnNwE0=;
 b=Hv1ss1xGl0C0x59wpqGHwPjYiXaIqo+E9kMjOasvgSZnTBPPOHHfXO1qmbb/xbCV47
 +w1/6spLyMXf+j0+XVHrxZFWHPE+tknZtLj+H+db5f9Yq0GMCxUDM5ifNaRRAafTbnoM
 uSN6ZAyju8Py9oVFavvrioHCPmWi/50mwOska93GYuyt39uyWOzf5pWnRTspL/zH5WAn
 TSuN5w7rl2vMY/jX41guzlrWdMTxaKhuHrsHBsSps/Afj7GyY3m99x3DH9CBXsG7OiBJ
 JZb+ktaE1yj1TcB/0t+jbVqH2orb5Wa+6ZQEd4yvaS0q51owm0L3ejXyB49fqmuU6WUU
 QifA==
X-Gm-Message-State: AOJu0Yz4gFb0dNY9JFNVvUBq+OWMIj1jemmTe+ejnboh1KEkrcSkYMWS
 NdQJNNfhYYZ9mDq56LpjiBAVT6+a7EY8EIzPJ86tHQFPX2ePdEkiph+D89n8HhZpGkvEXOmppxe
 8A8MMy1mVYdcBaRtVAZpA/sV/9YUeMOaqD8bUkrT1h927kVvQFheNwA==
X-Gm-Gg: AZuq6aKeZkI4sG6zyNaofAOKgE+m5MTzJN3eqgXTwEoh2Q2kqJt2fvfVEXmc2ZNgnw6
 vfQ4/p2iHzD7OnKOVc6Em7qwrzPGheg8Hpc/aTxGipSYyGStTSlPJf7lU7T0fw1alXA9Ur5AwA6
 KGs64YPVQ0lp5YSMzTrsoEniYdSMXaG3nodVZa3fyyk1jIv2pg6jLKPTm612Qx603X4TJ6CWBg4
 FVIxfb7fAfOAcgNrw3LkC4l3lGGDAh+HJ3JCxX4tDm2IDE0l7g+RHKD1oqib+ttGQ39MuDDtkxr
 vm4D/aTOFqpvZsz21Q2++synRMJelZe6kHNhberCWK4fGjQYu/wJEa6RgjLUMPTsgFkU7nRPLqL
 bzVPpxd1n5zEOi9MmwTCdJmXeA0wvzYwbrfQi23DaOVwPk5mTH4E9xKcked0=
X-Received: by 2002:a05:6000:4210:b0:430:f68f:ee96 with SMTP id
 ffacd0b85a97d-4358ff56807mr9143096f8f.36.1769006902601; 
 Wed, 21 Jan 2026 06:48:22 -0800 (PST)
X-Received: by 2002:a05:6000:4210:b0:430:f68f:ee96 with SMTP id
 ffacd0b85a97d-4358ff56807mr9143051f8f.36.1769006902075; 
 Wed, 21 Jan 2026 06:48:22 -0800 (PST)
Received: from rh (p200300f6af31d00062ddfb9151537832.dip0.t-ipconnect.de.
 [2003:f6:af31:d000:62dd:fb91:5153:7832])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43596b62700sm8490158f8f.42.2026.01.21.06.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 06:48:21 -0800 (PST)
Date: Wed, 21 Jan 2026 15:48:20 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 1/2] arm: add {get,set}_dczid_bs helpers
In-Reply-To: <20260105154119.59853-2-cohuck@redhat.com>
Message-ID: <6308d1a1-3e26-1eab-6fd6-0f855ae74911@redhat.com>
References: <20260105154119.59853-1-cohuck@redhat.com>
 <20260105154119.59853-2-cohuck@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o430dEvwigeaWz2ZMmIfMvOWuyhw2K2Sycy--15k_KU_1769006903
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.069,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 5 Jan 2026, Cornelia Huck wrote:
> Most accesses to cpu->dcz_blocksize really care about
> DCZID_EL0.BS (i.e. the part of the register that does not change at
> different EL.) Wean them off directly dealing with cpu->dcz_blocksize
> so that we can switch to handling DCZID_EL0 differently in a followup
> patch.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


