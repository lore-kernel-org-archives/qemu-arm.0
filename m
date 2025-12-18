Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A7ED6D22C
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 15:05:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWFZ9-0001PU-ID; Thu, 18 Dec 2025 10:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vWFYq-0001Mm-OB
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 10:05:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vWFYn-0005M6-PZ
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 10:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766070291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5ME0da387XWUkyEdEAIwpLFJ+Z76Aiyn4smi/VeXYPE=;
 b=HRDmGhUOM2VRqygnxlGcYgqwimI4lFglhKGzyLuiRwYwayEGdShLNBI/Jk33891ueMOImK
 0Zce9Y4CWIvGQvk0rk9abEGgdTleAgjuRXqDlM6767Ofq8gxGqlD+TqFwrn5ugXEfJd1PK
 qf/Kt15gzY4Q0jC4wnK6+SDM9aMGNEM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-TP736DGbMOyFvf6tI_cyRw-1; Thu, 18 Dec 2025 10:04:49 -0500
X-MC-Unique: TP736DGbMOyFvf6tI_cyRw-1
X-Mimecast-MFC-AGG-ID: TP736DGbMOyFvf6tI_cyRw_1766070289
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-430fcf10280so464230f8f.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 07:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766070289; x=1766675089;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ME0da387XWUkyEdEAIwpLFJ+Z76Aiyn4smi/VeXYPE=;
 b=lqTHbEW9Emf6jKpkgA0QZyr1bJTt8Nx5Yfs0KB5RUAXnxmtyHHBHKEp5Ot1rJSGxha
 lBzhk27lQC6O2gs2ZzrxR2slqkJoZDLpl1bw17N2Daslyced0u3ItXldM2XuCFMIF2PH
 TwJAjo7wZ9LoaQdas9zix8DL5ReZ+fecbbzdDfqUkGe1cakqaj5MT4pMGhElbGxXjKD8
 PDz7PcAEuZ6rocqi3rg/INHXY1WXHEK5BbWiHRTh8KNQaVS39W9rr0k8addmvfpiA2Qd
 5N9LR1xTfvJ7j9XeyjGFK7FMmyI2Dn9/Z6Rb7VaNvdhpoirDDKEBNnP3sSpotk9kxelc
 2KUA==
X-Gm-Message-State: AOJu0YxeUTBJOHcP27smieBtnemocTVtGLJIzJjtdqS3HQH1Z0UlYvX4
 DkAaq+I/q7WvoKvp076FcN0XKHcfX1mjMNQRyv0Psh8QmI8ulSiCBSnobtKLHXYgMv3MJFV58oX
 vZOF/MHDyVYlUmysJmwa/WvvkJf5jnRPYA6einq37AB2k32hT7oWiLw==
X-Gm-Gg: AY/fxX4cIXW0/cgvGGLag8D2wbTuxSmo+LTbkC2IdrKsO63RSo1gu5Ih0PYhjLo13Iw
 dTfr/wVIeAeYM62enY7XEM0H5KSV1iKyOv3SN9elkAMVKUP9HPy6+3+J9AbEXpL2RwDCmLd9fQI
 U6jNav71PgLTWhTrp75GG0cxMwnLE4VuAnnvCE5aUXtcWilTcazPK0YNns9fxdf1n7mNu1rn/th
 BsAVeiX+DL2WTNqWkpf1sUvrTMZ03hFEEAQ2F6hG3ujKjfbkOyxjDHArmL5EBNtwFFmNyTfdvcf
 cumVXpTUf5so4FK3EEYcZ5n59Zxza1O4cjsYpYsV5ffYGgCksUQEwRGtQ8BYzbOiojdnXXQCgRb
 ZmGtRThA=
X-Received: by 2002:a05:600c:c0d5:b0:47a:9560:ec22 with SMTP id
 5b1f17b1804b1-47a9560eeb6mr129130935e9.14.1766070288389; 
 Thu, 18 Dec 2025 07:04:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwydGIR4du4x/jzhPkgjqB3qgfrhaycAVae3BCuCHAF5xrKrE1f2uUI2JOFiTfrW+MyqgpDw==
X-Received: by 2002:a05:600c:c0d5:b0:47a:9560:ec22 with SMTP id
 5b1f17b1804b1-47a9560eeb6mr129130555e9.14.1766070287915; 
 Thu, 18 Dec 2025 07:04:47 -0800 (PST)
Received: from [192.168.0.5] ([47.64.112.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3029f37sm47183695e9.7.2025.12.18.07.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 07:04:47 -0800 (PST)
Message-ID: <73bbe76e-5813-47bf-8ad9-6cb3cabbde59@redhat.com>
Date: Thu, 18 Dec 2025 16:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/19] config/target: Implement per-binary TargetInfo
 structure (ARM, AARCH64)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Luc Michel <luc.michel@amd.com>, Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
 <20251021205741.57109-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251021205741.57109-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qo0wASqF_E-W1HYMptkfKIZCRgXX77EAzAL7hOBvuzE_1766070289
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 21/10/2025 22.57, Philippe Mathieu-Daudé wrote:
> Implement the TargetInfo structure for qemu-system-arm
> and qemu-system-aarch64 binaries.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configs/targets/aarch64-softmmu.c | 26 ++++++++++++++++++++++++++
>   configs/targets/arm-softmmu.c     | 26 ++++++++++++++++++++++++++
>   configs/targets/meson.build       |  1 +
>   3 files changed, 53 insertions(+)
>   create mode 100644 configs/targets/aarch64-softmmu.c
>   create mode 100644 configs/targets/arm-softmmu.c

  Hi Philippe,

I noticed that the "max78000fthr" machine does not show up in the 
qemu-system-aarch64 binary anymore, and bisecting pointed me to this patch here.
Could you please have a look?

  Thomas


