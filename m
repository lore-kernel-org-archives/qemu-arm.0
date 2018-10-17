Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6668078wrt;
        Tue, 16 Oct 2018 17:15:20 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63qu75lJpswDlK2wqG9zNOOJYQ1ymKvCH1+OGAsIn78gPcS5bn2jWt18u0G7Jr5ERr59YtS
X-Received: by 2002:ac8:3f11:: with SMTP id c17-v6mr22740833qtk.33.1539735320463;
        Tue, 16 Oct 2018 17:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539735320; cv=none;
        d=google.com; s=arc-20160816;
        b=EXfvzEHCb3ZUC93WiSxgSG7jMupml05L3dY5p5Jhefhem+0LY8ab8CcVr5D3YqUtzx
         4wybPYklMZ1V4D3RXamqVMqwCTgRDt3dxnI3hfOCzwinGSg34+X9zb77pKbqI5OgRDLc
         CNkD0k7cHN83+bhMYd0xmOJEE3KELOFBI6VIMROTjUp5DiXfrRwb06LrWHdj11E6JsTn
         hLDwGpuMav4CAqJzhDxeZs3BVUdlp3sak6skeZsY1hR6OOB3uOsbwgZlnNSdb50juwSI
         JcqZWNHV0/oCy585KBV45gs+1zd9Xr4psHPycNuaIfVteQiwp867NCi6BnwVCBEIGmDA
         hI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=XD9UpVeYlFjKnE96M7JW++6ZjDGG+lX2dPLDWNMdyT8=;
        b=ivJxA0p2N9IvoUwfAEOiclVoJf4ZQpPFo7n8AOKnuFI8YxFbiwEvRi1GLAi1hEr52n
         m3aY97zDVZjS0tFLUC666Vl3xzhHPS2HlE8qa1/FFzqt1QOBQIyi5uB7YcclxWXv6KIa
         lN7bj93T1QCsfJeXZ6mmxCZArNdVG2SF/S3zY9Zx8PgZJrfRwFsK92CMEo5KtT5Z1HJR
         CqPhDVBXU3kYJrt1jccSDiuxHv5CCzJNdOCkJcTYm6wF5nApApfH90dYmaYeyEA439MW
         5k9QLVxRCV/yxsrDKuZbhMMDN9OHNlitf2TD6z+NA23qRiTCQQiK8dYO0xPYHQ/EKV56
         WUMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FXOPgroZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r77-v6si2042291qkl.132.2018.10.16.17.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 17:15:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FXOPgroZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCZUd-0004VS-Sq
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 20:15:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCZUU-0004SX-8R
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:15:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCZUR-0004K6-34
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:15:10 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39245)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCZUQ-0004GU-Jj
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:15:06 -0400
Received: by mail-pl1-x644.google.com with SMTP id e67-v6so2793614plb.6
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 17:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XD9UpVeYlFjKnE96M7JW++6ZjDGG+lX2dPLDWNMdyT8=;
	b=FXOPgroZovlXcNuBmr7GAU1CDRv5Zv1pA+6EQ1fiHOaVkthgnw1V/2BOmSzOULKIDv
	T8AGfWwmaEhbfiC/Oxml9wpYz3LAAf7FWSId6K7VjXgXFrMKEwErNUQ9LL6N76/ZBXcv
	uv2TUlt9OqY6Uhrun5/LcRvoTXZLwq6JCANhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XD9UpVeYlFjKnE96M7JW++6ZjDGG+lX2dPLDWNMdyT8=;
	b=sE9Fdgjx4qazj6QJvPkVwN2JHcCrmp8yqMzx233HTER044RerOX/9fQRRB1y+OW05X
	JW00jIlN1Q4Kw8ydbyWSczX1JzoMlXBlh5Uy6pXum2I5YOqk1HGbH6lrydTdBuMGYtOu
	J5bAN9u8PDa1PQjLtj2S7WDsdj7EEtlG/vddsYYxYQb+iEaaObzG+KSuEYjuH+zV0SRr
	2NL4wnJxaCNIlNA3SWwWVzdjCNiHLvB7bb1JaroI+amHCetb/BPsnrQKvtqjybxwySWZ
	8xHbdxMYaiDK6BU8pT3c7I+Dl6BFU8Fa66Onmn9Kk4nZfbUnR0Kq10aFObbtq+00egbD
	KJVw==
X-Gm-Message-State: ABuFfoiKa0LeP6ImWeHEcEIGDuqwbm5AWeDFXsSIu4j0QdgngSGdiCvV
	R9dXbMRNTamsBITRjnpAj7ZxZA==
X-Received: by 2002:a17:902:b03:: with SMTP id
	3-v6mr23565348plq.141.1539735305452; 
	Tue, 16 Oct 2018 17:15:05 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	g17-v6sm23796609pfe.37.2018.10.16.17.15.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 17:15:04 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-14-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <81270d53-724b-000e-0bb8-da7ad761871e@linaro.org>
Date: Tue, 16 Oct 2018 17:15:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-14-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 13/14] target/arm: Implement
 PMSWINC
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7e6WU8SFieYy

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 39 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
