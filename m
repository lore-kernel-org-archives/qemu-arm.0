Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1018299ejn;
        Fri, 21 Oct 2022 03:08:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5lJGzMbpNIXWgyTZRmexcwj7WuSqJxUX5aAOZDBCR+C7BGa8ED6djuBngw0rhiUghlRGFz
X-Received: by 2002:a05:6214:5181:b0:473:1a26:99f6 with SMTP id kl1-20020a056214518100b004731a2699f6mr16192011qvb.47.1666346898948;
        Fri, 21 Oct 2022 03:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666346898; cv=none;
        d=google.com; s=arc-20160816;
        b=etAYYsjm1R5bLf0yQ8ogpGM8fYM4z0Hbji9NNM79WILoONmpGvNl2Wfmq8NnNEb7Oe
         zDlNfocXgdc4ZgqhAdSkHXhrwh+5M5rkwE0qeQx0HtQ82EBoMnphxXDj1TwCwp8dprz1
         Q8tMlvIYv85ZEk4t2jMqclTJpROj+rnpHhcZ2Z4Z61it3YP9PZeJ13jMc1Sk+LhrmyBN
         SrgpHrrsDueFFy36zbMjZrC2Gelcw2Ql48mNq3yl0M4aLlBCVDfdWfgrnbI+wsO1GAzV
         NpQ9GCj0pSJPgWnenEqo65N3u6vH2FufIcy3ro0hgpOD2hYBg7p60hFVny73Pn9bUREI
         jVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KF896TDIzcUGMhQJo9DTAWDEyHZePXKhDAxN7g2Jyxs=;
        b=khq5JUf4XGrD7jRLVSxHmRCix/B7Y67LA1JDsc4BSis8AVsAq7lqBOhItP4f2zkIzs
         +sHI+9a17EWEkgerwoDM7c9zt2WXtZ7wYnt7DlEojDcyCcMyEtRLIMJt/jf6O4m7Ngkw
         8hPGhoQJ1o63B199GwQdwJ41jiG1XNYPwiFrBcEermu4S40COi2RbPiXeEpbuch4B+7m
         ys0zMSBWsM0JerR+0SoIu2rse269SnSiflwuZ2sNo3ElNkm45sSotZ+OtvH6WSGdkGJQ
         oj35z4vbR2qGgDfyKrQTl66/+XBsJ7rlSqqWHmeMXokB+Iqg5lhmH6/RVc2ovFv6U9hS
         RbSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VIwroNG5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk2-20020ad45d42000000b004b3d8171015si13996815qvb.436.2022.10.21.03.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 03:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VIwroNG5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olowq-0003gw-AG
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 06:08:17 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olon5-0000ZA-Ky
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 05:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olomY-0007kU-5R
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:57:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olomW-0005LK-68
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:57:37 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so4478554wmr.2
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KF896TDIzcUGMhQJo9DTAWDEyHZePXKhDAxN7g2Jyxs=;
 b=VIwroNG58M68IPtsIx+/OP8ioqN4b7ePq46iBFfXrY4JedsR/IqR+dO/wS4iuPyPYO
 wrf7rLOwe2q3RjuZYEAJwubEi1+IwdJJrbp1kmqOKnvsvvZGwx3rORsyIC4LIcZYl7QF
 G1YuJmynJW9XCKme7Inf/zp0y7CisU+qkKW63r17Pvk6Rl8zFsvY8AAEkpNEEC/U2I2q
 hFdzQdBSAiASgW7QDskxEot59h1Dnlpx4nHcLE2OXhPBBsgMSklN0q6K0Hrq7U3jOD1T
 6GXq45IurtBS7hKNftkPvDTV9r7XAVsNaWSSaqKok6PQa+yYI9OPkAwF3I1KrzHUaL1S
 o4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KF896TDIzcUGMhQJo9DTAWDEyHZePXKhDAxN7g2Jyxs=;
 b=jIFxisf5aF1c8R7gofhGsUHJK/X6bi+SOovmZg0U6O5XUOog9AcVdEP+DOXBRts4D5
 iiQPmlKfg63Xr3ljbKHmZevaAWYirv3ndBrAuaPgBJqoNazjS53NCsMKvq3RMz/3DT5G
 yy6ByBdnkc0Laun1jzpDyL3aCRYbS2UxafkF/l2xXDyqws9GyjwSM5tzd4K2cpehAhrn
 sg+1tzsF0mUxERNmux75m7hWi0oBooCGzlYr2MNRcF+2DA8ZqtZhtsLJ6HB5xgp99585
 VTtbHGS+BQyAwaTjausAQKbsphEhwhYvcIrqRL9O+/1ZhWlIhRqScXSwMDw3f3xo0/Cs
 0I3w==
X-Gm-Message-State: ACrzQf2K3nYPAkMbJ+hnFY/RgKtJJ6uzR1Ll6GfbJVNf5pJKQJQSFpSi
 9KMMdUtQjNipgQ4kIuv6DoZtmA==
X-Received: by 2002:a05:600c:19cc:b0:3c6:fbb9:caab with SMTP id
 u12-20020a05600c19cc00b003c6fbb9caabmr14039355wmq.182.1666346253902; 
 Fri, 21 Oct 2022 02:57:33 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 a15-20020adfeecf000000b00228692033dcsm17878281wrp.91.2022.10.21.02.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:57:33 -0700 (PDT)
Message-ID: <bc6579b9-0ec4-44b9-4f83-56e50929be5a@linaro.org>
Date: Fri, 21 Oct 2022 11:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v5 10/14] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
 <20221020223548.2310496-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020223548.2310496-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q5uUT3OYUcYL

On 21/10/22 00:35, Richard Henderson wrote:
> Both GP and DBM are in the upper attribute block.
> Extend the computation of attrs to include them,
> then simplify the setting of guarded.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

