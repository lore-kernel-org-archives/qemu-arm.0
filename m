Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C28BC61DC4
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 17:02:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzdU3-000519-4V; Thu, 27 Aug 2026 13:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wzdU1-00050c-IR
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 13:01:45 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wzdTz-000264-Cn
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 13:01:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2d712281f8bso847715ad.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 10:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787850101; x=1788454901; darn=nongnu.org;
 h=mime-version:content-transfer-encoding:content-type:msip_labels
 :content-language:accept-language:in-reply-to:references:message-id
 :date:thread-index:thread-topic:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8+kxKG6VLsRBulZwbmISRI2Az+9/qH1/uQGV8zfJEp0=;
 b=iPinxIu1mZ3/KzmnYo3+rbvxmULxLWnCQLVMEBAdRCmwDJbdkf9bRimTBwMhqxj1tH
 JYOf1iqucuROwldkUv6v425QOqXNJfQ3adK+F0Cz5tNwq3QEP48phY75Gxg4RVmuuLrv
 OMxa4buIzXd5//pobAxNXZ5flC51HVd4IrWpPmK+1kRf3HiJlQc90gwH573D5iMvWC1o
 AA35PKpEBIRMCbc5mAZJxjqjcXvMHFgdyK1IKnDBDBV11ZcY3dbOJoKtpJdCQB6j3YNy
 vHjdJOty2aX3nQ1oYFYjfxPFBuDsgRxxT5ofizMyCLHCS8qYNhyAXTd9DL/RiSySFmHx
 dHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787850101; x=1788454901;
 h=mime-version:content-transfer-encoding:content-type:msip_labels
 :content-language:accept-language:in-reply-to:references:message-id
 :date:thread-index:thread-topic:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8+kxKG6VLsRBulZwbmISRI2Az+9/qH1/uQGV8zfJEp0=;
 b=pBpZ93urL1IaD38vWzk3BXkM83KM2CjJQB7fnOlZeGtdf7wSDQy+JM1b68NdTsmuu9
 4px6ucFcgcGf1X7JrCI9VrphbHyHhaUqBGQ3k9XKbeSww/6aDT0VmQa6nmt0OeHta4vT
 udKRKFdw1/20A9/7K3JOFRyWj1ko+meHy/CUlQ0faS9coXPWNymB0Jd2TJKTSV9oYlQV
 1bMzB/4Er+5gdKSfSeAi2jf+uhd6q1u9rh+BtjCA8a3AE6ggZiBBrUtFGSXoRd+YqoKQ
 Lm90y6iR/bLtzh1fVMtzLw745nw+liZn/SBw1wWxwV7cr6uQuTBnhqSnfL5eTU5DaVRT
 Tkow==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp9TiWYehOsYvE7OUk2KYLDeEaQlBHvErlEuHsVdqghIM/LvmiKKJ3Bc1rO7Xk0U9m9mp1zN6vLrA==@nongnu.org
X-Gm-Message-State: AFuF++nV9tmh++yQDlASPhjUIZ05ynFJYGbHtIvuMwZyzORhwoTyI1QS
 Gx1cqY2mpwugS2rpXFGqVnhbeNDEg6lhNbdBUbkyl7jKt1KTpyTyDuSh
X-Gm-Gg: AR+sD13na2gYxNv88oVTHMS6+EXH2gK9OAyjvbWDTaNTtoJcpLwInVxjRkKkI11xPVZ
 k86oGJroPC23poEo0XOg+3TZnfZzjnM3lOSdTDZBipanYGosIhpnASalWZPRjCNGEw44NYKSdJg
 R+mYNRiaB191mySIWFdmqtw+ruS3eDyftNzz2Fmc7jVGqfCLOB3xysO7hE0Nm3PGODtuGuZ+XFa
 3BPoEQ1kwheI9twsxmiKOwyMB3sbqgRaedVVGlsUo/6hJoEBaUKf9bQe8WpCSwZLdTK1ylxq3dK
 LJSECBLkF9k0hWD4ZjlysEhhLZ6pbsqXQg5QwLpCUhx6QGaGoDdQYdN+oq+77ETIuC+VixAhyDw
 yt/VtSFhcuUoU7VmnMk4U9t4mx6deOuvmPuG8hsRB2lgqQE5bku00mkuQ2cR9HgZluHOnyoKOOF
 sLzD326kwNgm1hx72LnDth/CZsuQaQpsAOLPA+m077j5loDC08NjE7FfP28JsSOIvRwigJCzbim
 /YncCXbn8NkuBymsPWCMlhuL8WR9AwRoPYwQ+6fvQVfdW5z+qH+zTeQ
X-Received: by 2002:a17:90b:5249:b0:396:40e6:f631 with SMTP id
 98e67ed59e1d1-396d0e306e0mr1295355a91.3.1787850101345; 
 Thu, 27 Aug 2026 10:01:41 -0700 (PDT)
Received: from DM6PR02MB4940.namprd02.prod.outlook.com
 ([2603:1036:301:207d::5]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396d2316e21sm57776a91.2.2026.08.27.10.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 10:01:40 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3 0/9] arm: add Cortex-M85, SSE-310, and mps3-an555
Thread-Topic: [PATCH v3 0/9] arm: add Cortex-M85, SSE-310, and mps3-an555
Thread-Index: ATRuLS44HD97kWM+YfPstzJYr9R1UkFjT2FDz4UUPgY=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Thu, 27 Aug 2026 17:01:39 +0000
Message-ID: <DM6PR02MB4940D2540AED137ED68D2944FEAD2@DM6PR02MB4940.namprd02.prod.outlook.com>
References: <20260818002629.172827-1-simonxhy0404@gmail.com>
 <CAFEAcA-bqCPVV2a_g-nav=GYj20DCOTU8pts4BRct8_qvqwbzA@mail.gmail.com>
In-Reply-To: <CAFEAcA-bqCPVV2a_g-nav=GYj20DCOTU8pts4BRct8_qvqwbzA@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=simonxhy0404@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Sounds good. Thank you Peter for your help with my first=0A=
experience with open source software! I appreciate your=0A=
feedback and hope to stay around in the future.=0A=
=0A=
Best regards,=0A=
Simon Xu=

