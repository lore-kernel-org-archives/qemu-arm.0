Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp622876lfq;
        Sat, 9 Apr 2022 12:28:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv4I/uXS2FCHWfVK2KSdmlZEhxUS2vZQOKBOfTekuJdkZ5QG//b5D5KLrbFIh7MPi95pzG
X-Received: by 2002:a37:c20d:0:b0:67c:ec4e:e59c with SMTP id i13-20020a37c20d000000b0067cec4ee59cmr16789020qkm.234.1649532501357;
        Sat, 09 Apr 2022 12:28:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649532501; cv=none;
        d=google.com; s=arc-20160816;
        b=zJzOtrEVr9juKYNepa8GccPVAAeDwlRNksQ5FjboNdD6D8EdWRfGs5s/fKqWGHq/Oa
         yhptYLyJg92n0gmbln+viaW4VONEoXm+RvsQrFyBZ+fv2F3Wi+sM9T4o3e54PiOUsEVi
         2Hz+xwYMzyIQorg2v49tjKe65ginDrk5sHiBXSi6f1RStum3Uo5/GhKhFHCCn4BjYinV
         xGSI8JZMCN9BSOAoQPPOj9tar/GWldxKAoAJY4+LChXbo43IomIsjBUVVgz6Al6TPTng
         qaHC53pEzoKkhGVW0CQqzTB2akB6tK6IZ3FW7hzpGHtoTNcY44geFnolm5E2T8hr7Tml
         XOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=wWbaO7s/5QhMwQwY2g4Sg0C/7U6kLHuFCVT2mjPQPg4=;
        b=m/D2mdHXcuwOetjX9N3Rc5sfefl7DFTHX+D5JGRQJ+u2d6stRBGTY7zMnWgXCPUNFC
         8B1oHhdugaFRH98oGZzbFzo54KY2HU8pD/wjsrzSANime8oicAHkmO+gdrwHo+rqvV1b
         KlG1YWCM9Q6pwFf2E9bPXW8dePOt6NszqUG1Kb5VeDhAxnNh8O5s6QhFxwtPaB7zPX3I
         r9IX8CjQciJ9NBeHC4jFlAyP7cH4oKuTD84OVbZL57R+iU/xuwM6Bqw74qtadw9H9gmX
         Pk9vQFcNrmToe9laDtJRFcc0kw5jhuu4LHSL7F0RNgiphzKhQF1ECSTlJh+r5NdypJ8x
         LYXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TC9BSCZJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a0562140d4e00b00443d9cd8e7bsi2109345qvr.198.2022.04.09.12.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 12:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TC9BSCZJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndGku-0007e1-SR
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 15:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGkj-0007dJ-Kf
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 15:28:09 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGki-0001v4-26
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 15:28:09 -0400
Received: by mail-pf1-x434.google.com with SMTP id w7so11211871pfu.11
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 12:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wWbaO7s/5QhMwQwY2g4Sg0C/7U6kLHuFCVT2mjPQPg4=;
 b=TC9BSCZJa6nG+I4LzD9QEIZXBUGnY81wMzhJljSKV6TaWGw/WQsPxLKCy15ccKFDZM
 fkkq78qG14+dKKqoDXrW9opJx8BLjQ1HUZXHp39It1RebE9P/rioLD4fCAZ5wCJArC0r
 zFTzcL1ZD9PIlztxUaRyoxDo8MSz9Us/UcOAm/G3PNBc3vpYdVfJQisFRIod2Rcsn3ng
 DBLN8fPo8zBqjLHihGdEWU994aP9egyg41f1e/+L5trYz0jtdV0NgWkgxlIRptRq2JDP
 7Oa8A1zuWmYA7dsGVc4GAJpahYnXqMDJOyX1FO6NTAUen9q2X7RATFio33+7KGr+X48X
 4asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wWbaO7s/5QhMwQwY2g4Sg0C/7U6kLHuFCVT2mjPQPg4=;
 b=Ab450XCWaWIEJVPGJqQN0KmVTNET8irhAvws7farL1w4cJDKMESl6qc34r1x4pxrSX
 wvUkvpa90oYw9XWPoj0Jws8x23PtCBOlZROw/dVPV7PgK5AjpaRFNCrp2MjW42kpYHiz
 hiaOz0l35EefaJDfi0VcJKFIDmCAgtZmN/7Mkmw3zsln0LzOlr/oYYdUrJc6DGoVHIwR
 l6eOi0ES6KoWq5SMVwDqSCHpUfZf6ac24jCgDfPaRGU5QgeTBwgGn6vy7lfuZyQ3EiRH
 jfZ5eopSjtiCe4APomXWb9mdp8+XHky5rbaLhrRsV+a4AXEPmOde7gDlF0zKw4f22VOz
 XsRQ==
X-Gm-Message-State: AOAM530GJ1uMffAS7YWuYB33H8zezFL0386qksNtMNj+mj2RCQjn6Zim
 ODfClDnb2NAM+EVnk6yjInDzf8xMJnHO7g==
X-Received: by 2002:a63:5756:0:b0:36c:67bc:7f3f with SMTP id
 h22-20020a635756000000b0036c67bc7f3fmr20646876pgm.389.1649532486702; 
 Sat, 09 Apr 2022 12:28:06 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k92-20020a17090a4ce500b001ca69b5c034sm15366141pjh.46.2022.04.09.12.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 12:28:06 -0700 (PDT)
Message-ID: <b2693e52-0dc8-3399-e457-791ef2477c6e@linaro.org>
Date: Sat, 9 Apr 2022 12:28:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 27/41] hw/intc/arm_gicv3_redist: Factor out "update hpplpi
 for one LPI" logic
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qdXWRVUuAyWp

On 4/8/22 07:15, Peter Maydell wrote:
> Currently the functions which update the highest priority pending LPI
> information by looking at the LPI Pending and Configuration tables
> are hard-coded to use the physical LPI tables addressed by
> GICR_PENDBASER and GICR_PROPBASER.  To support virtual LPIs we will
> need to do essentially the same job, but looking at the current
> virtual LPI Pending and Configuration tables and updating cs->hppvlpi
> instead of cs->hpplpi.
> 
> Factor out the common part of the gicv3_redist_check_lpi_priority()
> function into a new update_for_one_lpi() function, which updates
> a PendingIrq struct if the specified LPI is higher priority than
> what is currently recorded there.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 74 ++++++++++++++++++++++++--------------
>   1 file changed, 47 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
