Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC18C531C9
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 18:12:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnKNO-0000K2-TI; Fri, 24 Jul 2026 14:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wnKNM-0000J4-QA
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 14:12:00 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wnKNL-00058a-8v
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 14:12:00 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-668c1b780e5so360636d50.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 11:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784916718; x=1785521518; darn=nongnu.org;
 h=mime-version:content-transfer-encoding:content-type:msip_labels
 :content-language:accept-language:in-reply-to:references:message-id
 :date:thread-index:thread-topic:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6qqKZfV4yBrbF8HnRgxKqQMqd+QDHcV1SZ0d7hO7ffM=;
 b=Bdygot8EtcDPErnCnyKmPUtLMdaafdJAFC9V2lzOOns1DcDr3bWOfjnTTaCZu6jtZM
 H7F8L6xGluR2J964P+rPmUcM0+6hzDth7KxMowYvFxZV6ZjMlNegCOXnXddQYrqgl8Rk
 ZXM/5XSYAYftINePVkDhq2WzML/K3mpDuTbX+uUa/+LrYT5v9dyyX8hPdm3Lc9Okgktr
 M8qKq8UvZvX6erZJwCQqcB0DUEpT2cmudNaLDvpnrCsuPwmhTPrH+AjnmbwkTxkLARFV
 uzFlAEI4Q+VN6SrfrGyTmdQZEYDEmr3tKVlqCiUaUbjaJJRxTgDpG4dSZcsdrfhxO8ft
 DorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784916718; x=1785521518;
 h=mime-version:content-transfer-encoding:content-type:msip_labels
 :content-language:accept-language:in-reply-to:references:message-id
 :date:thread-index:thread-topic:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6qqKZfV4yBrbF8HnRgxKqQMqd+QDHcV1SZ0d7hO7ffM=;
 b=sjhGCcRgq6wIJ2RE3wxlnOuLzxdLL2aTl6zDxfvGKfgq+3e/inkYaFjK8uFulNJOvt
 fk4wCNuRdqnOM6A7Yds8JhYaItJUeSdpUNNwX2VWJaY8Cmv0HrfXXKjrtX+Rl//JSwYb
 LT7lWmE6M5mymIVqM+pWuibDQyxcvdqisjv8nMLqakgFjZK0734B0u6g+3qOboJna3iB
 /71dT07GWXv5UblvhzX0jPB8Iu//qkC5H3lQIUnC7HzpNpYDyP9p5bzVBFPlerdzrMMB
 iiwTcrp3zt+yzAg0QQ0no80mOYGTp31mqG8sarOKQBjD6hsr7MsTGcrSFeSaawoAqasR
 xTvQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoOPnsGCGq0nlGyS1Cv+xuGZ2HPDwRDIX9q3f1h+tfk9p6dgziIDw4kZgN1yq+ciohnwkqybPRQ2g==@nongnu.org
X-Gm-Message-State: AOJu0YwF6Cn0wX5O/sLqTKYv+MqQ4iaoLs4sfsjwUUndK2MqvoLBW2uf
 Xdw5GKv8119OJ16abxTJaZGCR/iS6VpYtNcDH9NQu9Bx1o5NY6SQeX/0
X-Gm-Gg: AR+sD10imWiZce+aNrodB4l+/0G6+ejpY8OG/YNwHy/1lkCpaibOKIth53ZYyd1DI9+
 KitVzll9+QmYm4dLwgmo8QAAvCwfoSR8msJQltL1oHQDX73r1fUqqitarn/59NGncpduvJryRlM
 NP3YfrVUzoA5sTq4j2O30KyRk57uxcn8HYK/r3pefXbratKfh2uEh3h0T3qsr6flhVVPdd1xeG9
 +MyxtOCTizYZIs5R8jjxz4cpqDaEyqDnH45UNqzqos0s/RVMS/1/tGadJIsw3ubvEI4QAtYXNR+
 7WtFEnBHFYCPM7fKhRKvs7k1gOW7HO30hTDwK8WqyAfBXckyaElWn0+N6KMCabZDue7O99PptBd
 /8/apD8r9AK1USYmhT/6s6JmTY8rfdRZZvWejCWSYcamaGFAx7eExMY+B0wowcHmUIaltLR3Ugh
 BXNhXKMyWxFwuU7KNkUjx6J/J1iPRwK+dGjw1FfWdpSZlynzC3zLNh6tHAk+uyqowIUWrIJw==
X-Received: by 2002:a05:690c:6c02:b0:815:bc6a:2e48 with SMTP id
 00721157ae682-81f4c1b8497mr29078637b3.14.1784916717784; 
 Fri, 24 Jul 2026 11:11:57 -0700 (PDT)
Received: from DM6PR02MB4940.namprd02.prod.outlook.com
 ([2603:1036:301:207d::5]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-81f657a14d9sm4046827b3.13.2026.07.24.11.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 11:11:57 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, Owen Giles <owen.giles@hpe.com>, Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>, Robert Elliott <elliott@hpe.com>
Subject: Re: [PATCH 1/4] target/arm/tcg/cpu-v7m.c: add cortex-m85 model
Thread-Topic: [PATCH 1/4] target/arm/tcg/cpu-v7m.c: add cortex-m85 model
Thread-Index: AQHdGvwURZg47sxgtkqdqKHoR5EWobZ8XSYAgACaFaw=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Fri, 24 Jul 2026 18:11:56 +0000
Message-ID: <DM6PR02MB49408F0E20F38E117E7FA08FFECF2@DM6PR02MB4940.namprd02.prod.outlook.com>
References: <20260723233605.805-1-simonxhy0404@gmail.com>
 <20260723233605.805-2-simonxhy0404@gmail.com>
 <CAFEAcA_Ybrqb0g-cZYf6yL2eHRUZ6PfeWQMiVrVVeFJFp3q8KA@mail.gmail.com>
In-Reply-To: <CAFEAcA_Ybrqb0g-cZYf6yL2eHRUZ6PfeWQMiVrVVeFJFp3q8KA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=simonxhy0404@gmail.com; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> The major reason IMHO to add a Cortex-M85 model would be to=0A=
> have a CPU that supports M-profile PACBTI, so wouldn't=0A=
> it be better to implement the feature first and then=0A=
> add the CPU and the board model that uses it ?=0A=
>=0A=
> thanks=0A=
> -- PMM=0A=
=0A=
Hey Peter, thanks for the quick reply on this and the other bug fix patch I=
 sent!=0A=
=0A=
I understand your reasoning behind adding the feature first then the CPU/bo=
ards=0A=
so that there's something to use the features. I looked through the patchew=
 and=0A=
saw that was how you handled it with the M55 CPU and v8.1-m features.=0A=
=0A=
To explain myself, this patch series was a part of my intern project at HPE=
. We=0A=
currently have a fork of QEMU where we use it to emulate the HPE BMC. I am=
=0A=
working on implementing the currently unavailable M85 CPU with the Custom=
=0A=
Datapath Extension for internal use. I thought I could potentially upstream=
 only=0A=
the M85 CPU and related machines. I didn't include CDE because it was not f=
ully=0A=
polished and PACBTI because it was not super critical to my experimentation=
s.=0A=
=0A=
I do agree there are no architectural differences between the M55 and M85 r=
ight=0A=
now so I fully understand if this patch series is not sufficient for upstre=
aming.=0A=
=0A=
Best regards,=0A=
Simon Xu=

