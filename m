Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8463DC88E6F
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 17:22:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6ANL-0001sL-Rm; Mon, 14 Sep 2026 13:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x6ANK-0001ry-Ig
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 13:21:50 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x6ANI-0003pb-Iz
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 13:21:50 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-396ccb65437so1533866a91.3
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 10:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789406507; x=1790011307; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y8Dq6FsLqmNEarBazbsxpjb/jQ5OvjQmhuvdiyYrYEY=;
 b=OtPumYcgEBfu8YS1HITRAbO4RiiV6dOUdHKnbhpek+63QTEVH9FG2F0w737kDh/tPM
 xw4Xaho8gdgk7wNDgifOH+uiPz1ZcwF384Rdabl3QsZrZ8URGa0baON4bj60Tp5Y9dLt
 8dey8iI3zfHUnVBerjDmXvH1tj6f7AzQL6Ej8HgFklUqiSG54aKm/+PZZLRHclCfC8MN
 rETwzupdTJQHHgjeHd6hRPyrNPPg391pMHZ0DroIRoc1/O1pCmEMGGRubPiJrMJXvxno
 0qLOOZDKUznYa0wzf1NKb3HhzoZIZx5nIVVI0VAGnlsjF5eHmyvBGtDC9kvrBpsNsUJm
 tf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789406507; x=1790011307;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y8Dq6FsLqmNEarBazbsxpjb/jQ5OvjQmhuvdiyYrYEY=;
 b=kdNDyCs/cABWs14dWea0l3V9X2whGUuW43ym1/0pigjukK5C8dVO8mzkMttXi+US9Q
 d53wl5yHyjEgXfRm+Qk/jNz8V38gWs/nfTtI+JVsUcQEIOUCuDv7sWn+Gqe2zC8e3szh
 aS03NMNLScL3uoROPAvlCjDg2dj5+hV2e1YEPrZTycFOff8F3wbEw1aU4gHoe4mWSxHt
 pMpFV0DGepNUoATRbDAnSvyzPCLaQSSx0V7CI8Monk+06toHw4ajYeO3LWur6IijOZ0+
 0eSgGpF5j6nK832jqElG9Afcp3BpFmgYvjRRBHYow39ibTjDjHxWgm0P3Vz616jDUrEG
 MZbA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEwFAYcyAQyYw3I3pk50o4+vDwwiERofagcj9bF92H5t+LHheT/PsB7kmrcxbCx4nUH2eGE9dHTA==@nongnu.org
X-Gm-Message-State: AFuF++lnTXRo9FsZo8bXzMLqHupPTZ4OlMNmqE2AD+wyDA2N3twPrAJq
 v1Bv0P8xKlIlg37XCJtteCeE6FK7zYSLgm2ximb5HT2H9Q47OrVlMjJ1TbQ73dSVXjM=
X-Gm-Gg: AYBFou2Lwlvpw0dATgz/Qu3FFha6roo/tip+WKjIYQ9am8d4FiVicP+hXKLoNuWCXVi
 Y9X56j4s7pKxdKn6oEtNxP/yCQ+mzrlOPKcqyVNAXEroSGCZRNm/JBjr3zpRmBITzSSG3DZPP4x
 hSWA03HWspVw1bhHu2Ha7LMCv2XabDTeNfiuavPXiMZCv31tNksSEeQob1vvCTig7lg7EQbqMuW
 Ss6U0fZYMokqJ+pjpT5YDzqlgAsCiO5XT68AGSnnSNrzH5bX7ny0psrqEO/t4W59u82vLrzfBR1
 c0hl6O46HJ9EVHZupEox3I6Iqks2rxigMePw+GdQo5XMzIKNPH694aSd91LRQGjltl1rOCvuJxz
 KahReFqDUvS/I9BZpKLd/R6wPcOWxB2EI21eZY6cIRO8KgQm2wL7McMirdB/eRKwSTQE4v68D4g
 giueFIgY5QwKomD3RwrJlFOm4r945Xg9Zgrw4Zsh5rB+PuoqRrfk6nqxo56YdO8n9q2WzHCj1Jk
 pLh4LnlOP4qPArZhACIZDvAM4ua3b2b2jZWATSMqs8redpzTscalvkKXoxLHw==
X-Received: by 2002:a17:90b:2cc7:b0:39d:fcbe:c1ae with SMTP id
 98e67ed59e1d1-39dfcbec295mr1273164a91.23.1789406506676; 
 Mon, 14 Sep 2026 10:21:46 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:7164:7976:4c53:31bc?
 ([2603:800c:7900:ed00:7164:7976:4c53:31bc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39dfdaccc0fsm459167a91.15.2026.09.14.10.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 10:21:46 -0700 (PDT)
Message-ID: <a930c1b6-dd93-46ad-9e61-eafda9dcaac9@linaro.org>
Date: Mon, 14 Sep 2026 07:21:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] target/arm: Implement HCR_EL2.TID3 trap on
 undefined TID3 registers
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260806173123.333423-1-richard.henderson@linaro.org>
 <20260806173123.333423-4-richard.henderson@linaro.org>
 <CAFEAcA-NoW=39G_m21zQO6CzH5UU3MnsKuFNjkjX-55gzXqD2g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-NoW=39G_m21zQO6CzH5UU3MnsKuFNjkjX-55gzXqD2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/13/26 23:16, Peter Maydell wrote:
> On Thu, 6 Aug 2026 at 18:32, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> It is IMPLEMENTATION DEFINED whether HCR_EL2.TID3 traps on registers
>> within the range which are not explicitly listed.  Previously we chose
>> not to honor the TID3 bit.
>>
>> However, with FEAT_IDTE3 it becomes mandatory to honor SCR_EL3.TID3
>> on these registers, so we might as well honor HCR_EL2.TID3 too.
> 
> I thought we agreed not to change the behaviour here? Is this
> just a "forgot to update commit message" thing?
Oh, yes.  Because I did update the code to test for v8 in translate.c.


r~

