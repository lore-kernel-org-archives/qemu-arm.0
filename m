Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp661344njc;
        Tue, 25 Jun 2024 05:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXsOQ+4KuLv0L2dCiDC3l8f13U9tBLx+l+j5m0626PCH8JBvlaXCIgL1wP0ITUDyCcEU+s0MB5cJ2NlqjwT8cAh6fAWmSs
X-Google-Smtp-Source: AGHT+IEHg3xU3Q/BSW6CDpApzUq4VzM6Z/t5U9xOkt8OnTIEy8yDLzO+HV9W3XM8XD1hRVK8I2yN
X-Received: by 2002:a9d:744e:0:b0:700:b1aa:bea6 with SMTP id 46e09a7af769-700b1aabf46mr7092102a34.23.1719319407153;
        Tue, 25 Jun 2024 05:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719319407; cv=none;
        d=google.com; s=arc-20160816;
        b=fpjhSMXXFfrqAmjafydfMXdryMa55+onQMO3OQWALwsWfLPhn7ee6oDUYBFZxbB2IQ
         bOHfdyvbWPnLFcrrgky3S5tiFcgPSOJUKImViTHY3nzfk0hA20ALpotko8kZOLocobza
         leqkP95SHXo9D6617xEwjpbS96JnL18docT3SBDCxvjtIL0P8f+J+kIbD1irMQSSftDa
         VoV5bQ5HsvOQNzODfSfKl9aJaMz0hnQcEDTYpkp3VU6xGWOTVEfeZagWm6Zn57MghDlN
         BLa1Qb2LLK7oZCDAX5CqU7gzCoabLTmnAC7SbpKYtaHpE99najBueHkkmjZxQNwKIom8
         qoqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9KT5wPwVBGAp6POKcn4D1ShlMSN8ZeqGVZRXSqSnOW4=;
        fh=vWsA+GXCRDT8JyMv6GtXvAYmKNpAwTlyQgQoXxcTDuM=;
        b=e9C/AcUbWSuQCt3c60o57YuDt8NFjBNHXRXQCynQqThn8L3fflPVK/feQLKwt3crHl
         hLJ9EXZma4Joku4efFeoqAiy63hfCgod+CGcuKomczz2hc4hsyFq1cOsjnZPWtxwGH7G
         rO5P1DnGFHP+RXivW6E2Z79OipySIi+xyI/EKcPYtuwVsDw2Vk358B5rJQDUe2g5Aiu3
         9LwAWm5iQWp1/FDlSVvbnXbGLuXs1TM45QIQDCN2SL0KhupOFA8zBJodicCueMw3d9Kr
         YKhoOPAhYT4vMD5BJFyuaP+h+jVM7YccFq28FMhgV+175l5WODdeTDKWizVmMx8BfVZ6
         88bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xIEexahV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce92cf30si1043620085a.466.2024.06.25.05.43.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 05:43:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xIEexahV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM5W9-000067-7R; Tue, 25 Jun 2024 08:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5W6-0008Si-Sv
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:43:23 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5W5-0002lt-6h
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:43:22 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so6804316a12.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719319399; x=1719924199; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9KT5wPwVBGAp6POKcn4D1ShlMSN8ZeqGVZRXSqSnOW4=;
 b=xIEexahVBMC7+oNUSaBnPbTlM8uG92Fu+eq2fo/fKC0ch6oCbJawrniXlslzucNx11
 NlAmgKcFUp3QShX1o3gCl7sffC8gBk20dE1S7cCaPBCt95gjbyEvltfkXxmQo7orzdFR
 ZBEHtygoG4lf92p79LOVaSqpJenv7xK7hTQrl4mfNP+YuKTgEeCWPEFWmTlVEZxxH/ty
 JVlYkdy1i+Uo9cFWxRUbhNaqCDunLEN/OtxieKSBOPb0Ng5NAE7zwVBhU46OQaN7mswA
 bDNLmLsQU8z/QS+AtTrmo2vKh30ClLTLZah6wmB8KKgiZXuMdsO6MkBMDLX0OpyxlwEe
 vQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719319399; x=1719924199;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9KT5wPwVBGAp6POKcn4D1ShlMSN8ZeqGVZRXSqSnOW4=;
 b=g7jQwt10fUQvmmUcmgnX92WxFoEQdFo+O1E6wMCpPXRdqXDjeHH393tUEJpaq+hXUq
 dhgaQF7neGjZ2twNeetqBUQTFWjBsTQ+MRBxYR5NcUFzNfRixmih/REKNJ/4oZjSCf4q
 XsOgwpy+//jNZmQBgYZhKs2AV90wdFQlb3zt3/ZJdLzYftlME+mPokgUNKD+d7SHg5B7
 GlkH/N6nxgRr7pWAUKKaSIjV+LJoDfq15Xhq1GGIOURy+RGk61KdcOUp7zVsznwkXIIe
 5jzE+Ivof1nV+i8jvLlp1cQyOK6116d0hC5fqNYN6jNbdJ5kK2fLv0FOkrcS/FELebeU
 kEkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNGHHAM0HSC/7lyH7iVAIdsCZSbQ3mt2OOQw0RoAkMn5e/yfFKzDWwjzDs+L48HqMSBNCG+R7cRJSwGDONbP0BZ/av
X-Gm-Message-State: AOJu0YwrnW3sEYjag2BhvsX4tfUzDz9R/EsW5+IUb+LjvVWzu29+K4+y
 gYF0bvOEnwYS6iMlvHflbLoXNbf/TMbt06vdcH8bTF6W9uwOXpFn/Xcw/Tzm/gorPj1szl8hnNy
 oC7Vj/mZNZcMI9cm/Cdc4M4NCyYTItnhy54ZKBw==
X-Received: by 2002:a50:9555:0:b0:57d:4cbc:cb59 with SMTP id
 4fb4d7f45d1cf-57d4cbccbf9mr5042493a12.25.1719319399726; Tue, 25 Jun 2024
 05:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-11-richard.henderson@linaro.org>
In-Reply-To: <20240625050810.1475643-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 13:43:09 +0100
Message-ID: <CAFEAcA9jh6aT5f9tVuQMqrt2GDT-csXuDMRQ6p=5sFZfm+V6Cg@mail.gmail.com>
Subject: Re: [PATCH 10/13] target/arm: Add data argument to do_fp3_vector
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H6e4lwxMkuif

On Tue, 25 Jun 2024 at 06:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 52 +++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 26 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
