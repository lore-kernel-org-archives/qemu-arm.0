Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DAA606A32E
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BC1hms+4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPJ5a-0000B8-3v; Fri, 06 Nov 2026 07:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xPJ5X-00008d-LZ
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 07:30:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xPJ5V-0000RL-Ce
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 07:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793968232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4bpLwBaW8vngKZd3M/1ErMLzaWmtpx/qJm7FXTqvY6o=;
 b=BC1hms+4m8HCisiVUaFxK+TKtNgQCaM2YwlvLr3k8dTphyRRxT4H7vvj4XXiQRg7Bn9Uyy
 VCXdTBcY8226ncK+yIa4yTYXluDgFVlTPTfdgYlRCCUPcRSY7xS32DyE97A3a0+Gufabuo
 Ektp8bHoVtfLlt3I0SYN6MkIGRucVto=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-xjrszgFGNu2axxaJuhDC_A-1; Fri, 06 Nov 2026 07:30:31 -0500
X-MC-Unique: xjrszgFGNu2axxaJuhDC_A-1
X-Mimecast-MFC-AGG-ID: xjrszgFGNu2axxaJuhDC_A_1793968229
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-49337a224a8so259757f8f.3
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 04:30:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793968229; x=1794573029;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4bpLwBaW8vngKZd3M/1ErMLzaWmtpx/qJm7FXTqvY6o=;
 b=byS9MkQdw0QpbYYrtmwc41rdba+XxvNELpQArxhOhr3dVmioPzadXtzDyn28ot0BEP
 PQwx8rYWIm0WQoFV/hYs+eAbaqX+8NDN5/MHkvbPAFdoyHdsqZP6szfXOlJ4PRmAwkp4
 0KRXUWUB228OPdkXAYf+SIVOnNb97kon4YGxiqawCq8w0xux5MV+wC20vpPh/aCjCM10
 ZVbK+M6DuYByOh9OfgtFbl/hqHFEETGN9wDXBDQnFqQ8GKoHoOObSgfupHhPAMZN7Jyu
 vPQOzUDzLRG8ER8zQ9o93uSaoz2joKeUTPIkGYLVOG/bam4VRqX9wJDH/5GLZ6yfn1ow
 QRdw==
X-Gm-Message-State: APuU4Z9h8n3R6OU1hr41cxuwnRq4ZlVoTmhbNLXw+q93MNAs6q9H9Wt+
 pJK0dpQSntBvyX4pi5wd9WFQUzhdJoHp4YHuSzkQzAeycClkYDnFBbh7dHb6Y/Cb76uN0sZFg8S
 A0DV2eFT4jvm85e1BvNjBUFfV9bu/POVbneD41DaETaTZmer1OY/wbg==
X-Gm-Gg: AYBFou2eb3Pdt/glqynw9bfZvr+3MM9eXtdb1qGRHdZYkwP4nKkjRDmmNoQtN75ZPm+
 wNZZVRa09p7IcXzQeblBAuseZGGnsaz/C2VodMhf9kXxFeoE37XvbrF0hUG0vv0mA3UrOviwrR9
 5DrPD++4Ma175JLhzFoFlWpCVE203pu1OrqRdyTk9eazuetYAxAGXUuMIaVT14QDk0Fzp/UwR1d
 NIDVJpkjpb20qebnBCpzt1RVWB2p4hw5VhpOUCLTGlu1//kVDDIaioHWST9dwYtsG0/Vo90HVSB
 JKjFDrCIUM27ItC52HCRcio/P9pgxqy28hp8SyFLXS+pKXe0XFTJ5hiv87aYzancP/7JXcuZ4YA
 x5lpTyzdLbXtybl6AkSVXlky6M9FXU22oljDny33EEhXHv0qWuFfPDaReKDJBOAM+kkItrtzZnA
 E2zwsbOF/WQQ==
X-Received: by 2002:a05:6000:2489:b0:48e:d7c:4bc8 with SMTP id
 ffacd0b85a97d-492732dc831mr5104399f8f.7.1793968229513; 
 Fri, 06 Nov 2026 04:30:29 -0800 (PST)
X-Received: by 2002:a05:6000:2489:b0:48e:d7c:4bc8 with SMTP id
 ffacd0b85a97d-492732dc831mr5104361f8f.7.1793968229123; 
 Fri, 06 Nov 2026 04:30:29 -0800 (PST)
Received: from ?IPV6:2a01:599:b03:7322:436f:1f3:b26e:91b8?
 ([2a01:599:b03:7322:436f:1f3:b26e:91b8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d7cc5e23sm3707086f8f.45.2026.11.06.04.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 04:30:28 -0800 (PST)
Message-ID: <57eb9b8f-a262-4e7c-9f99-1c1e338eca39@redhat.com>
Date: Fri, 6 Nov 2026 13:30:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/28] hw: mark KVM clock and RTC devices as secure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261029131241.2275706-1-berrange@redhat.com>
 <20261029131241.2275706-24-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20261029131241.2275706-24-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uuF_F_4AH9Vd9W8K0nyPXdh6XJbdrX3cU6D05v6NI1Y_1793968229
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/2026 14.12, Daniel P. Berrangé wrote:
> These are core infrastructure in virtualization cases so must
> provide a security boundary.
> 
> Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/i386/kvm/clock.c  | 1 +
>   hw/rtc/mc146818rtc.c | 1 +
>   2 files changed, 2 insertions(+)
Reviewed-by: Thomas Huth <thuth@redhat.com>


