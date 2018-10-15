Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4970925wrt;
        Mon, 15 Oct 2018 14:27:57 -0700 (PDT)
X-Google-Smtp-Source: ACcGV609kwTSaaQqIt1sLN0LfUPtzyMZMhG9ARv5mBZTZi8addzxQkLUM1iZ0Z2drKFdLuiKIbNr
X-Received: by 2002:aed:223c:: with SMTP id n57-v6mr17812300qtc.302.1539638877584;
        Mon, 15 Oct 2018 14:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539638877; cv=none;
        d=google.com; s=arc-20160816;
        b=RyhIaomaQzEFEGjG+k5eYlFIlluIny/b55NV02+4cAqKbPxPCOHghgff2CuSR6UnGW
         lnBdhGCyIPEHyR9u6yWxkvLLlvsIb9BzlPHs9XL22OMVZ2iO0E8eUu/9nj/otiD23WB6
         17WKKcEc0jDgtgF/r2EX7VUuZ87Cg4l6+NG+MciMciv6giqk+MAHHrMYgMUwPTZlHeFW
         rwUhAuLth7tM3fy6ewC9TEic1ogUKC0yGsPQ3TpsBy9e+yllBl94R094LEUAl3pajfnK
         ztcxeqQH25uf1iUik9BUZqviqlvlxE9ldwMRIN88qcZlIwmWpDwZs1n9E7K/svgZNAko
         n5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ktZkoldQGvodONx0BAyZkLqc2f0rl7Cibar+nbrEpKo=;
        b=fbTTms2lacx5Ti+aEzvuxCaM/WYkq+OuKWIfnE8628eZDpJlrc6ayQgOHcqsY3rIfs
         k/HGrwN8IF810ZUFKsuiUl0Oz04IJCoEFUxpp2SoWYmtKT7SFAUj5lUS75tCQVGYSF+Y
         T4vps9ADGdZujO2uLwWuzM3IUoaGdJXElDAWBP6c7r7SYZ3RaemixHKFlcEltd2Tj0qr
         XL6IDb915ZILK6KJ9PLWCKZsfhcacIdUAEWg0U2ZabFHuymjst/nzsxKC2bliMHY08n1
         Jq78tTOrJqam2F1w163PCDTSIiEiT1qrKhol7QVaGRDBTK+ih96vv31JkA16ZWrySsH+
         chkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bchImexZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17-v6si9617784qkg.75.2018.10.15.14.27.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 14:27:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bchImexZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCAP7-0002gh-3b
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 17:27:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCAOK-0002eo-7L
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 17:27:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCAOF-0001ZF-8c
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 17:27:07 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCAOE-0001X0-Nx
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 17:27:03 -0400
Received: by mail-pg1-x544.google.com with SMTP id t70-v6so9750654pgd.12
	for <qemu-devel@nongnu.org>; Mon, 15 Oct 2018 14:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ktZkoldQGvodONx0BAyZkLqc2f0rl7Cibar+nbrEpKo=;
	b=bchImexZMZb8CM3yP2dD6djIRKDm+rcx/H/j4Kbbam7LwmYkpzs/VS1vZJ6otPOk8x
	YH/vxGJ0kM2irgHhMVxEHZa2uLVhlUuWc7JVrgW7IFNVlV9ahV8Xe/+ZDrDJ/eOZJxpw
	FIRqELHDqGDZibbAVoQ6KIwbfhHQ2w84BSEME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ktZkoldQGvodONx0BAyZkLqc2f0rl7Cibar+nbrEpKo=;
	b=OLdyrq3eFuh8zI4AwUl0R7l/EaECCMLqwobfPikk01Pp5kPKloR7N41FkpPZ+/nPDy
	Oy7s/AOHP76Ee3vtPjZv3f1b1rYaBewYGpSCdGYNbwV7dflpbugFSfT3w/e1jm5xg0SM
	GRIMqQXkjb2UkMyA2OpEfhU6S4uGKqj+gFVwVtJE5kGQdDoUlt+YRmtv5zpbGBDv//KS
	XNRMCD1OYxLt5JUcyGjdkHe7zlN73kg5rXEZ68b5gCPKVItHxlGYf/jR/U5uQuhUFK1e
	oIg4KsdPhpZGrY+btiEXIuq8/eG5CTMmP1lO1U0w9sepffGCh3T/GDM6K6zECOtLkM7G
	ScHA==
X-Gm-Message-State: ABuFfojLp+Z6tXwMl5A2eIy4FdL7Z+mtca4uf/Thb38Dnn5KDA53p//W
	lkPykP5Dlt5vCGIHzPdFQK7Urg==
X-Received: by 2002:a63:b04f:: with SMTP id
	z15-v6mr17691079pgo.442.1539638821265; 
	Mon, 15 Oct 2018 14:27:01 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	n79-v6sm19862567pfk.19.2018.10.15.14.26.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 14:27:00 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-9-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <aebf02f2-bcd4-b2c7-1657-2caea9c54739@linaro.org>
Date: Mon, 15 Oct 2018 14:26:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-9-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH v6 08/14] target/arm: Implement PMOVSSET
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: etlKoUR/+Ie5

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> Add an array for PMOVSSET so we only define it for v7ve+ platforms
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
