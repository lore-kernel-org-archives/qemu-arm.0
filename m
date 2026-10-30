Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158FB606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SZudoiLo
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMpH1-0002Mc-G3; Fri, 30 Oct 2026 12:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1xMpGt-0002LT-T4
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 12:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1xMpGs-0006Ui-F6
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 12:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793376959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oAENEnC4rOLT5XV87ofUY9Oqla9pGvvnmgW65KiQORQ=;
 b=SZudoiLos6Mg0eJhqGq8qtmYuWxyr1OKV/IlDEG+8WWC60PSHEvM7/SD5U73pU8aqTIoIr
 V/oNVKw2KHpL1+yc4Qhm+YcyD+/SHLJStGWbhjVzS3o+bLIzX1fOc/bdYfdIQHn+lUGJ9d
 EvuOqTcakBjWfwFMAiTG8HO/d6nhtaA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-3Gk9TtgZMdudZ-asj84--A-1; Fri, 30 Oct 2026 12:15:57 -0400
X-MC-Unique: 3Gk9TtgZMdudZ-asj84--A-1
X-Mimecast-MFC-AGG-ID: 3Gk9TtgZMdudZ-asj84--A_1793376952
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4a204f135ffso5024435e9.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 09:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793376952; x=1793981752;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oAENEnC4rOLT5XV87ofUY9Oqla9pGvvnmgW65KiQORQ=;
 b=z3xVFBNSWimuorCh3IoBJFPpgRWz2QN9Z4UQ7P5Pj94ODlR+alp0bqOCbQCC8FB+KF
 u5SSAGiNAO46W9mjFBPGHaMOnstVU3LSd+nExTcb78lPGzPXWm181rUHWzO8u78W6vf0
 P6uph61s5jsKg0E1EWyqQPnO+1MaosmKbf4GzaGp0UNEdAKjydoLBgngevvyvScgIOtV
 oomwykh+RnmuSw52Re9lMsK8IiZD8UqVik+j2CxzFvUdZiQgLYvdroJvPU5XrgC4wWUm
 RMmXr2zBZ7n4w14zMdXjHmuqJEwwuVHe+VTabIQd7Mg25RL5g6x53nYBbyeYiPhVVRTr
 C5vQ==
X-Gm-Message-State: AFq9FYIKg/3u2kZmEhrEGQuLBWn8v2Ict36n3QpKgy6s4+yI7jNA8aFH
 6B2IEpft8DShLFU8TAjkbj8UszNvchANyuwRL0ZdBg/lToqt6I1bSjeFgYoN7mev66Kr/MEmbPs
 F6xsJ8ojNbqUnB42iXAE08NqfhRYP0Sy5br6VRcyYqBMZ72fJ2crgZw==
X-Gm-Gg: AYBFou1jgMeY9SLm6yX59UOhDPbrSBhyY6RYPezoe7ROdKWRUv9WdcfHnzxJ1qDUP60
 HG9TfKR1y1aZn47YtGxU1kpjREuTR7GiHnfy87HcXaHyzS2qINhV6A01M7hpNHhoJdGVNq0HisW
 JNCWbwpaJyKy/5MyylH3Rdx61uhbDxnEmRve9F/0YV/JBI7wkacV3ZvCFyIks5sYsXZcJg9VdiO
 xw8vYf+tHMBnnky1KtftqjTmarLdq+LddsNjWM5mWLOFshDIemqDhN/H+Vy/n1WoG5T4v1PpnbQ
 2xdrVzl8239OnCoc2fQuudRnX5PQaxWw1krL6SSBtSabmDVhKNDiv4CTtQsBgOpf6oQjDzKy1JE
 3bBr04Po+p7nbA6bp/9pXUotJTHrut9nXGMuEtn8MY9l99ADwSc5orq1fqWRxTkZa7iSBA5hylg
 IACVm1E7CCzFV0e2et
X-Received: by 2002:a05:600c:c4b8:b0:4a0:1b14:e283 with SMTP id
 5b1f17b1804b1-4ac150b38dbmr66321495e9.1.1793376952590; 
 Fri, 30 Oct 2026 09:15:52 -0700 (PDT)
X-Received: by 2002:a05:600c:c4b8:b0:4a0:1b14:e283 with SMTP id
 5b1f17b1804b1-4ac150b38dbmr66321025e9.1.1793376952220; 
 Fri, 30 Oct 2026 09:15:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:af16:8320:54ea:4bc9?
 ([2a01:e0a:f0e:9070:af16:8320:54ea:4bc9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa80f04785sm147561725e9.4.2026.10.30.09.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 09:15:50 -0700 (PDT)
Message-ID: <8b14772d-1844-4760-bf3d-d100e8b3fbac@redhat.com>
Date: Fri, 30 Oct 2026 17:15:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm/cpu64: migration tolerance for PMMIR_EL1
To: Sebastian Ott <sebott@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20261030143435.57230-1-sebott@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20261030143435.57230-1-sebott@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v4nxmXoRfYKK9Z0UpMPoF7s3-7lYa28q8lIwHOa49lg_1793376952
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 10/30/26 3:34 PM, Sebastian Ott wrote:
> PMMIR_EL1 is exposed from Linux v7.3 onwards. Backward migration
> to an older kernel would fail without cpreg migration tolerance
> definition for this register. Fix a couple of typos while at it.
> 
> Sebastian Ott (2):
>   target/arm/cpu64: fix typos in kvm_arm_set_cpreg_mig_tolerances()
>   target/arm/cpu64: Define cpreg migration tolerance for PMMIR_EL1
> 
>  target/arm/cpu64.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
For the series:
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


