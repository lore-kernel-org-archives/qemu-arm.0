Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2159957lfm;
        Sat, 25 Apr 2020 11:50:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypITma7JcX85xJaCpXe5gbykKOlnpns99+rZZ0sOirN5rQayah70ddIJUfisDO8gL3+DpdA9
X-Received: by 2002:ac8:4247:: with SMTP id r7mr16326083qtm.52.1587840616116;
        Sat, 25 Apr 2020 11:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587840616; cv=none;
        d=google.com; s=arc-20160816;
        b=q9EWhES06p33hdP/I42SB8GZqJUh7rt30yF3wBhb2pNPTpOj/0kUuLbisxm6zdDAza
         hBswmWjNuJD66qN6msqAJu5v5e+9SA2m+6SQgqqrceeK/4rGq82rVA3gn+iD8PpLFHR7
         o0vC2mlmfWzw4oarDq3mC+XS4rCBBLfd1HLCb4Z1PSgkVUuULiz4u/qD8FR9nVE2STTC
         p8qT1EUcjOt6/5gsXkCKzqSY/d00dwdk9p90XdYKD2WlHv9KPWam3s//7ZFewDyPTt4O
         HeX37aYOu5iZx8O9LR/eJfnSaiYk/LQb+FfiLKJCPI22RFwR/iS4oLQq1dnPJwb43mbt
         TCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KMg9u5ehDVdDTEzdNRyC+vwZGTwgqWQFH0etykPUyEg=;
        b=1FJuX4rElByx+6i2ACGW29MLpjcNnVChSZ2KO/GhPXjOEBocQW4PJZrAcYuib505lL
         oy7l+yD2FbwEhxJBnEl7pCbx3leHE8qeV+sWgylVCPc1jg3Gxjkglhjm+vcHiQmI7kEk
         vc6HdA9kjY7tUnJgaMSQ/vDYiAGSbN8KGB5Q1fzE9quJLoX24Wqly54yaJN78k99usEC
         zSnCyk/EwIb0SfNfu9VtfcFaUgCAmiktJaekUqPHrOdM/UOwPUUjpekZ21JQT8joqABu
         HzTwhfTy2/lrTTDdPVSb7LPLvRc0YczutZISYGAN/QfZsG7XBMWh3aMm3qxqsRLmXdSi
         XymA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qZdHuo5/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si5800204qtn.245.2020.04.25.11.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Apr 2020 11:50:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qZdHuo5/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jSPsV-0005qL-GR
	for alex.bennee@linaro.org; Sat, 25 Apr 2020 14:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jSPro-0005JH-Gz
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 14:49:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jSPrk-0003NU-0E
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 14:49:32 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jSPrj-0003NH-Fh
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 14:49:27 -0400
Received: by mail-pg1-x530.google.com with SMTP id o15so6350501pgi.1
 for <qemu-devel@nongnu.org>; Sat, 25 Apr 2020 11:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KMg9u5ehDVdDTEzdNRyC+vwZGTwgqWQFH0etykPUyEg=;
 b=qZdHuo5/uAusFkzgnRwqB9g9VJWYJS1acnNmIdH1IeNzlK0GVwMi8At1cIeg6ZIezq
 AWPVuVFRBfgLVZAiYLZMi3m4Bt0WrNCnVXM4P0n1NC4OyMe87g1JkZEb/XJ1ji6QwGvF
 jKpBkMsL0MRFKGORmZA6Ro5dsYWZGmyDi1H+tGsxde8znFmHgc0JrNhXwnzvDRlFaGY0
 DPUw6+WpJedUP5IhIoddGLsdOWQlRLvWq5EK9C5Tc3OBX4ScU1Qaj2azPDBfZfYnteZc
 RQaA/2l6PZ5ahZvqmAW/eBZ8B3BPPUqar+glW6BRyicx9I6o90CJXEwnqxGp1FUAbl7o
 BH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KMg9u5ehDVdDTEzdNRyC+vwZGTwgqWQFH0etykPUyEg=;
 b=jUrwnRYtMV58e0/BM4uHkVYfMq9HNixhywKS0/otx1pX6YeMEuBhigAmtq7OaMYLDv
 EShbBTJFkDpocZVUPSdSEV3086Yhb1xJRivXKLB18JSGbdtuQ8KOcXqcs+khs5ABXlCX
 1NXfg6X6ua5adRWoHQUvTUAPDWqiYHYuxBeL54DBrOrL9GPUV+tDwfy0e15akiBY+1gV
 211A9W3/kHAg9A2FuypyniyFpLAG3cya3zxbp85GUvleZTkna1ovuoi+sqah5W5ZtrSW
 RUJDywG3jldRswE3f3+/9r5da8Hg8khB9X4/3qojxPBH8lGvKNCj2nlvHWPci8ZhMIjR
 rJKw==
X-Gm-Message-State: AGi0PuZsRnPMnJ2Jx9RH7KBu77W3dWVicDFEo9kSPvfVj2h6NCJNnuih
 SpAghCdp3sdPQFf55Rwa+bRPN5pUX8A=
X-Received: by 2002:aa7:9a52:: with SMTP id x18mr15714990pfj.139.1587840565379; 
 Sat, 25 Apr 2020 11:49:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 14sm7983759pjd.36.2020.04.25.11.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Apr 2020 11:49:24 -0700 (PDT)
Subject: Re: ARM SVE issues with non "standard" vector lengths
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <CABoDooMSCvi4sxWS-a3cQksD3V5tnHCUbGPsxW69Ou4d1rpQZQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <082800aa-0cab-f331-c9af-2e59f5d5897c@linaro.org>
Date: Sat, 25 Apr 2020 11:49:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CABoDooMSCvi4sxWS-a3cQksD3V5tnHCUbGPsxW69Ou4d1rpQZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::530
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4JQWhI9O8NnZ

On 4/23/20 6:59 AM, Laurent Desnogues wrote:
> 2. sve_zip_p
> 
> This generates extraneous data in the higher part of the result.
> 
> I hit this when I got a wrong result on an instruction that ends up
> using sve_cntp which counts all bits set in each 64-bit chunk. There
> might be some other instructions beyond ZIP that generate extra data
> that would break sve_cntp.  So perhaps it'd be easier to fix sve_cmtp
> (and hope that it's the only function that uses bits beyond vector
> length...).

I don't see how sve_zip_p can set high bits.  If vl is not a multiple of 512,
it writes in units of uint16_t.  This cannot produce values outside range.

Are you certain that the high bits were not set and left over by some previous
buggy operation, since the uint16_t writes would not clear any extra bits?


r~
