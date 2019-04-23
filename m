Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3778350wrx;
        Tue, 23 Apr 2019 11:19:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwh0o/BSEzm9lmMcaSMRxBA2mxXCoy1ec2hkuIbd/Fntubjqjqqpd81CxGPX5+sJBYEkaGm
X-Received: by 2002:a1c:cb0f:: with SMTP id b15mr3317277wmg.88.1556043582239;
        Tue, 23 Apr 2019 11:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556043582; cv=none;
        d=google.com; s=arc-20160816;
        b=L0Tfkw1tuvI18+EyrMd+BZjReHLeVZDKWtvbukgjRVi7kJOp+faHlOWIG5X8HNQrPl
         UU7xAvnv5FTtHvWXsC9J/Z9V+xOW5PqSYOwitDy10zsZ/Fx231yCcHQQ8DxoiOFi9I7U
         h4Miv1ZFDQpMiyV0gHbtETejvHhQY8W5+HZY8cFWRR2eLxJoTfH+sIk7G2Nivne6my2g
         j86Podx7P5n02UnZWPA2dA1wndiztWJxjCX+NHrxdw4koPqJirFWcMB6uU3U1PLdarrp
         5Rw8TLBpKa7oiMTyF+UsNx7Zd1CexGAvW65fPTnejxdFrLrRRwkTJzw4u44YarBddY3f
         3/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=vfyvn11smECe2f2UW2BDcJAI+g6zW9RtaHTxK/MNreo=;
        b=eGhVAJ5VyceBQEzHIfOJlhF+nlnNaGgx2+AXyvkg1rHRBvTAAkeDGEWV+9BlQGJ9dK
         M49dkROe734Vv4X2PAR2+5SWecVRlD0laJUIV8/fxrkYrDsWo5rCAyfTE/X2EOIKh5ZK
         X7LDQmYT0XGciGQzpzaNQBSu/3YGavGLaWa6ehWh740bBXPcOZDrsaEIgjQfbTNtWhK/
         BiWI/wNF0DEKUXQBiCsNZnv/ScgIvaFIBUIsngywoTA2MrW/YGfipMMEh8p8u/8rSxFO
         7rctH8HApy/AhRe/d0kVs19wl+orzDvSDfDZUF9d2A2fCFjxMDuX+EY25pGROYBb7OSH
         k2mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YeWVsztK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si2488962wrx.449.2019.04.23.11.19.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 11:19:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YeWVsztK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ017-00024p-CG
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 14:19:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ00z-00024M-4i
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 14:19:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ00v-0008Fv-5f
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 14:19:31 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37030)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ00u-0008DM-Sx
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 14:19:29 -0400
Received: by mail-pf1-x443.google.com with SMTP id 8so7910834pfr.4
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vfyvn11smECe2f2UW2BDcJAI+g6zW9RtaHTxK/MNreo=;
	b=YeWVsztKfpQXTxh1yXZjMfNqotsYe5mapNecFrjL5J/A5Io9BWtwCBHYWsM8LVEyjk
	DZh5xEeA5JGn+l2lRh+3zMU/2rJqm8oH/JQsEkfU71IquNWrS5zM05ZxW0iqLKldHOyQ
	gkZBgBZNH7lMa1VQNXtlBfwd3DZBfFjP64I97Fftep6RSOqTOTZqX8aoMGIv6gWUTWDj
	gmLCybBE+cjlnPnAMXkLul9lOs8RNGbrzRuHfOo/lzxhkkNfe3TZmLcfyaZaPUCpekNL
	jbeREJV+tQfr/U1L1qnQl1K2dixsudk/036eJINMZdGuF3OnoyVlkSCcxQqqTspTOmtd
	GV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vfyvn11smECe2f2UW2BDcJAI+g6zW9RtaHTxK/MNreo=;
	b=Je94u38JCRZsjwzx7u589Uj+Y8utkOwJ7daUlU8Hd50ML1khiM0RLrZ5JGY3N6/VPe
	Kn+UTx8DQXtOgLn4iljstCn6Qa7nUWM3EQU2MOwHvG6HXhStnM76sYXDQCrLuBYYzGO0
	XikOwYUQGa4I/3cawI+XFUCoKPG95pEGO/ZxjysYIDWXd6Y9+ZEq6X1E3pb1bGtN72gy
	nadzrM7/6qGa9KoJJofc5lo6nGa5D8e6k0lLmITsoY2Fu7WTdtyobtp3xMHSLnd5KFZV
	aZ6ifAJBV4fZlQJJcH/iJN2cUbo4czBCW1QjcI8Civ0QlHYY2wLTho/bvQCxkucWMcal
	+HFw==
X-Gm-Message-State: APjAAAX9AkN9svjPajoaf716FkJySvx0IxReXh3TmWuhiQ6/iPgWwR5c
	mKQEA9f5S9MAYuokvPalDR4FBA==
X-Received: by 2002:a63:1359:: with SMTP id 25mr25539688pgt.92.1556043566744; 
	Tue, 23 Apr 2019 11:19:26 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	c3sm29267491pfg.88.2019.04.23.11.19.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 11:19:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d5f58c94-3122-9c65-6f6f-18d19acbad8d@linaro.org>
Date: Tue, 23 Apr 2019 11:19:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/26] target/arm: Honour
 M-profile FP enable bits
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 08UltsXQltQK

On 4/16/19 5:57 AM, Peter Maydell wrote:
> Like AArch64, M-profile floating point has no FPEXC enable
> bit to gate floating point; so always set the VFPEN TB flag.
> 
> M-profile also has CPACR and NSACR similar to A-profile;
> they behave slightly differently:
>  * the CPACR is banked between Secure and Non-Secure
>  * if the NSACR forces a trap then this is taken to
>    the Secure state, not the Non-Secure state
> 
> Honour the CPACR and NSACR settings. The NSACR handling
> requires us to borrow the exception.target_el field
> (usually meaningless for M profile) to distinguish the
> NOCP UsageFault taken to Secure state from the more
> usual fault taken to the current security state.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c    | 55 +++++++++++++++++++++++++++++++++++++++---
>  target/arm/translate.c | 10 ++++++--
>  2 files changed, 60 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

