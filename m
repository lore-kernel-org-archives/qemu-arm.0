Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B03606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WWhnsHOJ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMOmO-0007tw-BU; Thu, 29 Oct 2026 07:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMMsx-0000he-Ee
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 05:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seott@redhat.com>) id 1xMMsv-0000iA-Vh
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 05:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793267844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dKAG+ubY1efSPUYqRkc5qEyTI2Q2ES4PrGzlP4BhHMI=;
 b=WWhnsHOJoGEcdqNGNYkmD/evkj76fkBaEfE5k/KP+ZtscNxxLVZUuymz1Cll8N5EIH6Oyt
 oFHyzksFCUonJ2H1yKwLuvAmc1GO78ntiYFN7vGa5wh5ti58hCVtIhs3H8pyPPW7Ha6bRk
 4fAhyipnRBQ2QJnBL1JUqbhxw+Q9Idc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-bd0yahxcPK-jduYa5I-PMw-1; Thu, 29 Oct 2026 05:56:15 -0400
X-MC-Unique: bd0yahxcPK-jduYa5I-PMw-1
X-Mimecast-MFC-AGG-ID: bd0yahxcPK-jduYa5I-PMw_1793267774
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-48b02d63407so1382937f8f.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 02:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793267774; x=1793872574;
 h=content-type:mime-version:references:message-id:in-reply-to:subject
 :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dKAG+ubY1efSPUYqRkc5qEyTI2Q2ES4PrGzlP4BhHMI=;
 b=plBM438rOv98kg5d+2BYrc1I3kyiFEA9bHGu4Xz2A0gUPl5C7mydTdLEYLIeipOTAz
 +3Zc+e1XVr1HcqULlswwx4UbuqIu76cUCEkyEbkquxGKGfGMZJGAq0Q9QLlLUWP45IVA
 4AIcoWfwIWMHQIAFFJfit38Bp9NfF9mwQVqKcnpbvXUdPCq4AZIcgV8nH4Yp0Oybr497
 PxoxgatXaxyym8NDLOGqlF8HefG/kuXdMcWv5DR4eB+r0om44Buqp6UX/5web/lriYEw
 X9xDMiNzRTnZsAnr4Qj8sX8N46SHbEh9HZt1FvDQbF+Xg6FFrflqDa2y6MBCA569G5Nf
 pU6A==
X-Forwarded-Encrypted: i=1;
 AKwUvByyY80wMOzU2K+DkJf6ze8tRWXAWczC5Rigryrj4sDeYGA8WhZSWXPaXZkE3Rm+qo4Rq2xOFKisBw==@nongnu.org
X-Gm-Message-State: AFq9FYKgbGwVRnzTx15G8VWAkmNCCWgBVSv/qAyrm7jGDEX96usa8R3J
 Ze+pIuR70fA8rDwwkn5MMa5MX2hP96R3FFZUTaDqzG7m3RqlBJGvcV15kvVgvJC/DXKOsnCp0fq
 2VhNM31+ibOFX1Ir6GfjHzCid4wbHruapmkF3itv9Lvhis9sRwTQd9w==
X-Gm-Gg: AYBFou3HmZjCNxJ9zc9sYOMDGAAVfdZoyG5qesYIBhThhPtTDjPjeo6h5qw87k1G8XB
 og2AZX70w14dX3Fr2T8lcyZ5q7zaFBdZzz4qx/E0BaIi9Tvrdo2cWBZ6PibEnDgHdv4N69hGno7
 EEbWaxjuVWRYjw3kyvqfD9YImav5/0wAcHPUqVN20DsUgufmNozS1e84tvqKeOKn4o7m6AD/NHI
 cZXk+XtROLiazGNUeioS5pAkerDHRNszG2ZtR/lPyWRYKeOlqk1PdDfrO5ZGH00uQx26OwBWV7B
 dYfQeiSf9D4vgQ67hTqKWHRACFmnE9B8BVp5vlpQUaTABA7OyEhSvPvzVI9aNg6dmssnr8IjVcA
 Yr0QoRxm3boa6YniOnX5U5dJqbNnkeXmYzDvctmAVVcC8UNU57F3Vpnc8TG6v1mWiE2i6TruGEY
 GfyzGdsRDk/eO0iskJBhzCGh/E/lmufI4matGOtgs=
X-Received: by 2002:adf:ec49:0:b0:48e:1f08:4f05 with SMTP id
 ffacd0b85a97d-48e5d5d0998mr8591630f8f.33.1793267774276; 
 Thu, 29 Oct 2026 02:56:14 -0700 (PDT)
X-Received: by 2002:adf:ec49:0:b0:48e:1f08:4f05 with SMTP id
 ffacd0b85a97d-48e5d5d0998mr8591577f8f.33.1793267773903; 
 Thu, 29 Oct 2026 02:56:13 -0700 (PDT)
Received: from seott-rh (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de.
 [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e4806e208sm27588138f8f.40.2026.10.29.02.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 02:56:13 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:55:37 +0100 (CET)
From: Sebastian Ott <seott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, shaju.abraham@nutanix.com, 
 khushit.shah@nutanix.com, richard.henderson@linaro.org, 
 pbonzini@redhat.com, skolothumtho@nvidia.com, philmd@oss.qualcomm.com, 
 7746591750@163.com, maobibo@loongson.cn, harshpb@linux.ibm.com, 
 amachhiw@linux.ibm.com, daniel.barboza@oss.qualcomm.com, 
 milesg@linux.ibm.com, farman@linux.ibm.com, cohuck@redhat.com, 
 armbru@redhat.com, mbawa@redhat.com
Subject: Re: [PATCH for-11.2 2/9] target/arm: Move REVIDR into isar.idregs[]
 storage
In-Reply-To: <20261029092307.281287-3-eric.auger@redhat.com>
Message-ID: <8e4a253b-aae1-7fff-6273-d95f32976954@redhat.com>
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-3-eric.auger@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uvj3ToBfgWhnaa9vA8opQG2sHvnXe9BVlvWnZl8cwGU_1793267774
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.129.124; envelope-from=seott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Oct 2026 07:57:59 -0400
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Thu, 29 Oct 2026, Eric Auger wrote:
> Move REVIDR into the isar.idregs[] array as other ID registers.
> This will allow to overwrite it as others.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Khushit Shah <khushit.shah@nutanix.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


