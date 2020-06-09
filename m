Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp761553lfc;
        Tue, 9 Jun 2020 11:46:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmK8K72zDoCWNRnaV36JeIpKEp0u8jORYK84iP2wtfbXyzUtgFpfNbP8gvNwQWwMf0a0l6
X-Received: by 2002:a25:544:: with SMTP id 65mr8925275ybf.309.1591728362216;
        Tue, 09 Jun 2020 11:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591728362; cv=none;
        d=google.com; s=arc-20160816;
        b=oywwooJc9h4iOOYBzuNKeu0ySRyXEmBG4DG9/3dqw017FbNILSKBM3D+nQz+ByVesl
         dH33ZwdFJcJPsPBp+KYjWAWRxiYklYh9aU6x8rjAr7X+o+cFVHmowH90SA1g4GOcrH6K
         +Qf/iDTY3gIQT3pDWnz1wo2hLp1WXPbWYsa0YtG/2xlo4q/FrOXQZnGd5w6NmDjeFNXm
         3DiN0L7S0vgQTxpltTq4LqZnUyG7r6J+uEa94fXrrRlnQ1pR7mChyNutFqfLgiHgABZk
         /f1652kSWYY+QuO+8WjQMufazPOCRwdWVYnnK9hmqWVLhyK3eGjepeXwg2OydmFvXSXK
         NjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qbtct+EQ4KokFgvJCOyoGOryBmvkopJsWFZLu1mOk14=;
        b=S6f22cCZbI74hpA+H8RtbKny5dTwdCN3ZWdxpB5NiETxy2VX2q4aAMDCMbEQwyGyhL
         1AJBUiIvcG9uosHDQof6kNSKGNsDAn6gDa/WpxZfZMt9L08E3Cdxrj82TNtwsgIJOk1Z
         3eyV6zx7uIcejmXOdQogF+tdJTDy81vC0js2aRIvG5+xhaDybfxbVVHqBAIUkn3DyHa7
         nSxNRsw3bwzr7Zx3DIgUCRjOnsrAP1XwuTrddxv8oTqlIIUIAm1HFmccWaM0IpgJKY/j
         KJBjRis0obr2tRlFMD53mor3kJrAWH6a6w5J9k3+TzwufxiJcE70+jgb5hXSNmkETVmw
         q9+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UputIKhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e127si3357313ybf.458.2020.06.09.11.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 11:46:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UputIKhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jijG5-0007kD-Hk
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 14:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jijFo-0007hs-An
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 14:45:44 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jijFc-0002GI-8l
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 14:45:43 -0400
Received: by mail-pf1-x443.google.com with SMTP id 64so3597907pfv.11
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 11:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qbtct+EQ4KokFgvJCOyoGOryBmvkopJsWFZLu1mOk14=;
 b=UputIKhIdLmaeYsibJT8kBX0/pEm6qHNFCQxyBCx6KcyFzHkZXEIo4inDN7jjQOAjS
 BFupJDhvgdIgazRPJNJHKP6jFja5AVx6HzAEwGU7B91oymF4zufqlWcxujN+n4kaYSfG
 BysjUZxhiZeT1420lPdAmm81yqT/u55hso/zX7VISogXpwkRsjSJYfb9orvbs9RIM1xT
 3PlHhGYQTXZOTlfW5q007pglxRXEymBdcaZpdhmJ4vOQuOQBkH0v9vwW0MRP8hACRwPm
 5yX2h0Cym0X91fnmNbiQ7J3IHUkvHBhRjVXMIuCEIdTY12JKHNjN1AGmrnVLiBB8cuyI
 PGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qbtct+EQ4KokFgvJCOyoGOryBmvkopJsWFZLu1mOk14=;
 b=mxB7zNk5yL4fFGP+dsqkiWVmSQ8Q7YGYb52nimB9p4PGia1qRrClT9gQ6hnCXbxcAZ
 oltqa/DTNlXM+gLbDmivpOg5zPSJtpd5GS4rVLdLYetbdfIgcGSwR+Kjr5/MLXFSkrGf
 QyVlaVgHIGuToKYcgZmX33XD1DRCxyFCXkrPLaepx0dUHJ9Qky1WQWQd5KKYjIsehJ5f
 CKjiqLLOzx32WCJL8Mqw8+yiWVSBdjB8DQGhhBemsSi7RdOTKvPflZV0pQZDK2PVXsBB
 1YhphNn+M9mcWKRhYtixHpIn4SmnZl/Iu7WKPaIbq5pVPcUwB4HWQQjLRdXcXs9XlEtr
 Byww==
X-Gm-Message-State: AOAM532gHES1CIUCLHo1+jbwhqN3ckZIo8MTNzr68YVPyzpNXdE7s3Wi
 My2Or5RjtX3FuC6FrvtbHby+Rg==
X-Received: by 2002:a65:454c:: with SMTP id x12mr8308290pgr.313.1591728329852; 
 Tue, 09 Jun 2020 11:45:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d15sm10540797pfh.175.2020.06.09.11.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 11:45:29 -0700 (PDT)
Subject: Re: [PATCH 6/7] target/arm: Convert Neon 3-reg-diff saturating
 doubling multiplies
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200609160209.29960-1-peter.maydell@linaro.org>
 <20200609160209.29960-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7f35c6d-1608-e285-ee83-2e3df8bf221c@linaro.org>
Date: Tue, 9 Jun 2020 11:45:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609160209.29960-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e42ZJwlnisMW

On 6/9/20 9:02 AM, Peter Maydell wrote:
> +static bool trans_VQDMULL_3d(DisasContext *s, arg_3diff *a)
> +{
> +    NeonGenTwoOpWidenFn *opfn[] = {

5 more static const.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
