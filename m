Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp982287lfm;
        Fri, 17 Apr 2020 14:24:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypJtwjVItEX0w5zTb0+gB2vm3FGMcm8H0MWvLKtiorRxZcMCyIB//5BVfo86axtO2bICs4Fd
X-Received: by 2002:a37:d287:: with SMTP id f129mr5276299qkj.52.1587158690204;
        Fri, 17 Apr 2020 14:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587158690; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8AAXe1wVuIkthpUw+bonURNSsj+SfwTWTHtZCIqdKNA+OjMIUn3DLJpgebBOVtKFN
         eRPNgY7IB2Wtjeup2c9W1k2JbTBpnrmFojkU3Xv0qttq8v1rN9G13YQbWQzXLdjL23H7
         cBN8wXeSx8TxCuRtzG3DIOkldhUuY/r6i3ra+0CwoGwGcH5Sj4MUmN3aP+zitR7O4jM1
         sUt3VOsfFSl4wPE53Rl2G2bd/qBtS00vUKCQLS2xNz4/BlEFyAioROojqtAFFwQzTezi
         TSXy5m68+q4nWu8MEHFzmgIJGFvZnlK7pmI8XGoj4aBe2EoAoMJVrysFrlMz1cOnqRmx
         FA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=o/HOXdmdZb0BmsCOpVAfwt8rIREjuInC2IMtHu75w7k=;
        b=U0xZ/hJLBSrfzxM1VvnYbXcQyMUWfWnuicKiBL0xJxJWkQEbuCb1xSDjsslW1mGtXt
         H/xLHHOAr3Yn3cvgn2c+jEVnNIWluSPgCuRaRk4oTNKgeMz67g0VuBeWEAJukOy39aXS
         J9CmIKCLzH1jioOr5HMcRvvaBbfx7p+7fDvkc0ZqXFCrfVBkzhKI43c/TXSC+gerYwMm
         EuxtGbea5ljAvIFEPQY5UeJ+LOMgwYlT/LdQGOtR1WoWtfDgMt1EXzXoUdw50kro2VMw
         P92s4MHkBjpgvzMWdymWHfdnm4u7hVffCgkiKIY7ucAZ1Jb/WXlIsPzfY1KoVhmfFvat
         rcXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mSZhtTcj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si10821308qvr.114.2020.04.17.14.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 14:24:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mSZhtTcj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPYTh-0002dy-LE
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 17:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56303)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPYTJ-0002aD-0V
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 17:24:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPYTH-0005NM-Qy
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 17:24:24 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42624)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPYTH-0005IV-I5
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 17:24:23 -0400
Received: by mail-pg1-x544.google.com with SMTP id g6so1689244pgs.9
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 14:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o/HOXdmdZb0BmsCOpVAfwt8rIREjuInC2IMtHu75w7k=;
 b=mSZhtTcj02mbFxyrl/J74g3J7Dtn6D+HJQD04hw2I3+11Ai7qW3IQKk9feE/aCbRQN
 SZaqS/eEIG7bvQYKTiGak0rx2PvVulasmaF9Ff42GsF6xeB1p6xPrWRpW+kEJDBIWdxv
 lU4sKH8jIhPDmq5ktm7pH5UyWEfy9IRVtP5qi7EtS/6AJO78wPqsi3n47WdblxfCq4x6
 VMOyGf5OZXEuFaebHiQlpf2s2qRpR+2+08SIb/v9c0caMxtX29/7NMiIJbJCjCbbxGkw
 T5IZR9WQvdZQzpHSqENOp5B5XXP2kXSG+RlpK/lesdnHWEsggLB6P6ErS/XD8VfnBNUk
 gs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o/HOXdmdZb0BmsCOpVAfwt8rIREjuInC2IMtHu75w7k=;
 b=X1teKaPM+1lM6eXdZ9oeIB5d1wtZkhLPiV6VOLuAdYHlzl9609SrTSSORGhZietK+T
 LmelBAP3QljVyavh3X9PTblB+MrZFwk7dWRdzASajhD8VJZosOYLP9XmM2NJyvJ/ITap
 iE+31hDMPuVZFCdOd4r0uGcQI9SjWgCcXrtw/6UTDW/tDhKUJHnjIoQj09cIjXkOM0uQ
 s2iNmQpGr+49LXkUdac5nUCFqFuC7Wwwlnx3Dn8FsySX15Q7RwXgf9VB5ZcDATvAsJUa
 3bEmb38Y7k/6nMul+KJ0zmvf8zShvuC55ZE5745L79ekX6GgSAsVT7GH8DP1zY0rOPLv
 ZkpA==
X-Gm-Message-State: AGi0PuYucTyMtI9t5/FdBrRggj62Sw5PzMjh/MbDsuVJUgWqthN/ZEc7
 5tftQldPjF/rw45o9NFkeg53AQ==
X-Received: by 2002:aa7:96c1:: with SMTP id h1mr5295521pfq.212.1587158660802; 
 Fri, 17 Apr 2020 14:24:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id j4sm16371665pfa.214.2020.04.17.14.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 14:24:20 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/arm: Implement SVE2 RADDHNB, RADDHNT
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200417162231.10374-1-steplong@quicinc.com>
 <20200417162231.10374-3-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7593864c-828f-5c03-c3d5-8ba8eab8cd6a@linaro.org>
Date: Fri, 17 Apr 2020 14:24:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417162231.10374-3-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h8A1xq1ZM3AN

On 4/17/20 9:22 AM, Stephen Long wrote:
> +#define DO_RADDHN(N, M, SH) ((N + M + (1 << (SH - 1))) >> SH)

This formula will overflow.  See DO_RSHR -- with some added parenthesis, we
could actually reuse that macro.


r~
