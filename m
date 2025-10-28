Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F1DCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 13:22:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDje5-0005lv-IR; Tue, 28 Oct 2025 09:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDje1-0005ks-5O
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 09:21:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDjdu-0002uS-91
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 09:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761657697;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fA6XqgFHd59k0CDQMyi7P073g3XKZIpAOLwoui7XJc=;
 b=F9DI2lO57njmrVj3t+UNealAyUz2UM6glJxFfXdKf+rmbKUDu5CMHgJ79R+hwX2XPVbOZR
 fV7KWxNkiidfatFNxeFYy7Id87FibYCJsazymbaaZFEaa3JCUY4q5kzQlgW+jPju2FsxkT
 DvYYRoKg3zgtpsDv3p0K3/bdOLLWPw0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-Dh0IOUpWObqO-2dsim6rnQ-1; Tue, 28 Oct 2025 09:21:35 -0400
X-MC-Unique: Dh0IOUpWObqO-2dsim6rnQ-1
X-Mimecast-MFC-AGG-ID: Dh0IOUpWObqO-2dsim6rnQ_1761657694
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4770e0910a1so14102845e9.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 06:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761657694; x=1762262494;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/fA6XqgFHd59k0CDQMyi7P073g3XKZIpAOLwoui7XJc=;
 b=v1A/dK0w6CrafeETVvE5vqpPH16J9HTjouhH/EFp4N9R2XBpMmpMltUvCTEVl5+li3
 Uri3rHF/uelMbuE/Zp9PadHjLNzbx6sL/PT27J8X3cqXIvQoXT8tT2TX7jRzzoHdFFEp
 0w/6W9BZ/9JhQZisGbi0MdUDS2xj7/YWRdzrNINYMYoL+iMprWIFUSSm1ggIfxWf/7gC
 7Y5hC25whZAFsgZZwjB08V1gJ3NtSfmFac359UztIYMfS426OylUL6qqkjMa18CdGRlO
 3VUGcTVAEP3RcowORdBoFeOCj3kEPhVpgkQG6NUzg2aK5S0tIvxfVJGHFggnB668q+ts
 PiPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqYW6Lpd5jYnyxHW+AOyBMoWdAShntqvzngeNiPycrt2fRgxM0Qd/u6Yy1FsDc/eiSWa2HHk2qeA==@nongnu.org
X-Gm-Message-State: AOJu0YxvScdqcr8bgwh1AqC0dg0J3Nj/0hleoeH8Lkd7opyOqpl4ZAUR
 W6hqw55GWejk3wJKQ0MmhmaHhGgsb0CLjb4nsCVTBbI67HpVSp8Qo2uxLF3JMKDQzDVWh9VfRhI
 Tdy64uXGz0S9igo4c2Kfrd6iEkD46aFAzp1eJKFlC4NaoRY93s7f3hQ==
X-Gm-Gg: ASbGnctEbqj1L3BYqUClKUjCPsIRhTfiGW3KiN/JHdb4/g0oC5n1g3FaO4fn5xfls8g
 PRmLNmLCuq4W3EqODUE05M7vv0NbRddfsFDqKHX+esba3+j8ObfXbRzEofpRn4tpZGu+bbujLKO
 wbG5OuIU7JBm+4ak+BYKteevJ68ElA7OpkKB7LoCf3YpKbZq4bX42R4Dyp3eiLfU5NJLkODxTKd
 MFArWLi7Y+6Rg2NGbflji/JY0doxwS3vP4MkqLsT52p6enw0tWa/8wEfC3Qct5URMHBTFhgURzv
 XOQIB/Vb00yA6LWf7sTnUDGyVtGyR4ryOFYpJeRviEgMCGA/R8yJEuzEn4QpaCpPrBv4qBmw+3q
 4h5yI5XrnHXjHrrponb7K9PTWQcwudChn6snNZ+Cm8zVcbA==
X-Received: by 2002:a05:600c:34c8:b0:471:c72:c7f8 with SMTP id
 5b1f17b1804b1-47717e4df73mr28081945e9.21.1761657694235; 
 Tue, 28 Oct 2025 06:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmjabWNvxjRhgK7uAjt58Mht1VBFYfBF36smLEnF0w9EpnY2MHrTv7vmZ0aU+XsJEAprQaMw==
X-Received: by 2002:a05:600c:34c8:b0:471:c72:c7f8 with SMTP id
 5b1f17b1804b1-47717e4df73mr28081685e9.21.1761657693824; 
 Tue, 28 Oct 2025 06:21:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477c92sm194181615e9.2.2025.10.28.06.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 06:21:33 -0700 (PDT)
Message-ID: <9748e922-057b-4e7c-ad6b-b83f5591290a@redhat.com>
Date: Tue, 28 Oct 2025 14:21:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/27] hw/arm/smmuv3-accel: Add support for ATS
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, ddutile@redhat.com,
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-23-skolothumtho@nvidia.com>
 <26f4d9b2-75be-4913-bb60-01e647a7ec83@redhat.com>
 <aP+oRLu/BYNaAPHG@Asurada-Nvidia>
 <25d22f06-69e2-4954-9bd9-f73f899fc114@redhat.com>
 <aP+xhmLCRu6y0eQm@Asurada-Nvidia> <20251028121625.GF1018328@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251028121625.GF1018328@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s1wFDoaSMfX2hjOjwFnzM1QGApcZkvzxeL8sGSeugMQ_1761657694
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 10/28/25 1:16 PM, Jason Gunthorpe wrote:
> On Mon, Oct 27, 2025 at 10:53:10AM -0700, Nicolin Chen wrote:
>
>> Hmm, that sounds a legit reason, though adding the ATS support to
>> the emulated SMMUv3 isn't seemingly a small effort...
> What is "emulated ATS" anyhow?
I guess it means implementing ATS translation requests and capability to
send ATS invalidations. something like:

https://lore.kernel.org/all/20250628180226.133285-1-clement.mathieu--drif@eviden.com/

Eric

>
> Jason
>


