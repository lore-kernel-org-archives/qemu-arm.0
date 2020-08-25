Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp98553lfc;
        Tue, 25 Aug 2020 11:51:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv+8kWhYTNJ0AcM4JiUXqJYEJlMyCKc6aDo5FHNwvdQSF9uAJaaj6fHAeoLCvgetdKFSOg
X-Received: by 2002:a25:e745:: with SMTP id e66mr17600831ybh.483.1598381485440;
        Tue, 25 Aug 2020 11:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598381485; cv=none;
        d=google.com; s=arc-20160816;
        b=FqI9vY2Z7MsHijK8YLYXB1FbdqGkVSMUlUD5gkKtsFZ4RYoLbROFN8QJJaXhUiFHUY
         e1RsUQCtGhMC+G9k+KS9onnW/IlzcFo9kYS2z75PpPKPUsRmvYrtP/kymfi78OJhLvow
         BcRrZOzy8ZRr+9Pm+ddrF6PNGztEgmBJYqDtJ1872ie3Y9ch4rbb/6aKm+dyYa9K/tJT
         BF7Sya5KMfm2Rsfb6B5dhM7A8/5DqKDQhAAiy1bVx93osrdK9RCp7gAZgTt/tQ4MJ7XV
         /vGGOpMuChUsp+D23yCZh+OK5UIrnj1VcMBLwmbqk2thVX5+sv2KIcVYurWttW6TW37T
         Misg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rvr6bqVGFj/ysVS5qEZqXwCul5yg7EWzLjB6YbEAgYQ=;
        b=ycjmnrcx890U0VilLCdPfWxt+FNVZEeZrHIx9sv8gcuePvbH86GOU9H4w3Or7m27QK
         8Jk0OqUHnxR7lszS6g/oZ6gYgBqxaHSGeFgru45qfWJUG3VY42l8UijrDaXTUOWJHWLE
         5cbR0Ildep52Zm5etpDwqR3C5W9EXRmRYxcBmsVAJoy7jth/xDydXQmxkwZvLv3C6Coj
         L+iqjmvw9tym3fLIyTsP9iVkEvN8TKTSPz1kw2P2n9Ue6pFvIaBu9KBrejb7hihQn/41
         Q0xT+Z+KAUc0oy0Z4MK2JDowx7WQKdpQeBubdymEjLTcR3EGlqHsF4o62cJ/FG2l14nG
         d8eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Trk79zjw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16si14541302ybq.73.2020.08.25.11.51.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:51:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Trk79zjw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAe2W-0000NR-PB
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAe0p-0007MU-LB
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:49:39 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAe0l-0001lD-Vq
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:49:39 -0400
Received: by mail-pg1-x543.google.com with SMTP id h12so7450112pgm.7
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rvr6bqVGFj/ysVS5qEZqXwCul5yg7EWzLjB6YbEAgYQ=;
 b=Trk79zjword6lZs7x5FdxzRqEwZBXyuuxKVurOp1jttaKNAkH0e/oR3nHNqCzD6xMV
 XJNt8nfTvRTI/vdx9pv9nrtUQlJLs0z6K+Ddx4gg4CkWdXIoTkue9IWlzYcotR29GQBV
 zJ3kn7sjlRaRXLEm3uL14g0oSem/IMte2xzW8+Aau6w+5duSnOa7nNZWpVAldp4yxjFm
 OYfXgDiBCSqXK4y0/iLsWi1ytxKl+dC/BAPFY7jltQJlQwcKwjtAWkJtBYTmzPI8vAqd
 PuoV5fNd4/2XT9BmmSU0wrRC9see1GAHSP59IJtPb/gv+I0lFN5lCXWY0h8hr5ADPgQj
 vUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rvr6bqVGFj/ysVS5qEZqXwCul5yg7EWzLjB6YbEAgYQ=;
 b=gGpZ9pyL5wH8GQXZbImjZT6MgzFeiheKeYU0Dz3H7pHEnG/Y7Fd7n5C9CFZVWQHUvg
 hFzsHgU2SlgvDVqFcB7TwESvh3A+62S9CGZXenuBOciaU1gwd8G312bNQLgVHqCg+MJU
 JO319XXPu7Sjqj9a8dSljXrkp2DZ0byajJe9oPKVIvf8V/gjzc4Dtg+OpG6WGdpT1kI/
 yFzxkDFAlw3iKBRvYtqtBJCgcvyps2cQQBHuiak85k9vV4iINPjEE+OQOe4bs6KH/66w
 6ZjeLeu9VAOTsklDIG8YVloxEfEiaIWP2857x3r/YBQr6/mb2jy3vVchaoQ23l8e1QLn
 eQYQ==
X-Gm-Message-State: AOAM533TrSE5GwpEW1E7N5z+JY3ddqXNOb7ja8OeiPzo/+HrwByN3irZ
 awun2S3AsH2nPo1hmJJJIxxRMg==
X-Received: by 2002:a17:902:bd07:: with SMTP id
 p7mr8610185pls.26.1598381374534; 
 Tue, 25 Aug 2020 11:49:34 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id l1sm1827743pfc.164.2020.08.25.11.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:49:33 -0700 (PDT)
Subject: Re: [PATCH 15/22] target/arm: Implement VFP fp16 VCVT between float
 and fixed-point
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b8e4c732-169e-2153-98a0-e66407693db2@linaro.org>
Date: Tue, 25 Aug 2020 11:49:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: vRdCDnrDiS2i

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement the fp16 versions of the VFP VCVT instruction forms which
> convert between floating point and fixed-point.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp.decode          |  2 ++
>  target/arm/translate-vfp.c.inc | 59 ++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
