Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4848100wrt;
        Mon, 15 Oct 2018 12:28:04 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60HSIzNkPlqqVOdAkrPvOKqAZg1bCx+Y9qw7UsyRbfmaCPN6xcJoN04ARKNEwNop9rB2Qa0
X-Received: by 2002:ac8:740a:: with SMTP id p10-v6mr17788340qtq.65.1539631684028;
        Mon, 15 Oct 2018 12:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539631684; cv=none;
        d=google.com; s=arc-20160816;
        b=UAp/V+rsoHzJ0i1GkJRGDUXj8AJJGu1150P7gnpSb2jAb6F9266KlLrtFoq3acyZMi
         gLCTpXd7mCtupbgppIK+fS5gTPwZQY4AG8fAdwWW5OmqzFlBhT6hpWbavv7oX7eznRKe
         QQ92dkRYasb2AMVuc9R42LsWSr9VSI1tvMdQE8kCLbOPork61CHcThksC/slUdcU3ehd
         bs/CxhSYu6E6RJuf3GlyucK1/1F1NtjTfBK3plh9+wGTssKRwYgfXMYnhnJLv9C5jjxZ
         xQB1ustTQjqe34+gOCBTZw4Npua6InHvElBCmfVUztZ1ag2HhHhO/4zCtmynj3vJZ49A
         /+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=vEeuctvZqqak6vDqO4+JW7AqOcEZtccnGCFudBjM+v4=;
        b=Jr3F7B+iv+E5updLwIQH8HbWy3ZmvRkLiXY71+xzMXWCQmiUd03RBTPm/slmzyQ6jp
         ZD0LBhxufgNbZ2ER8eLvut2fjZT0RInO0HahNG5tZ/4Msw217o/dcvTWOVcFL65ebaL2
         dYpingAJM5gumP+/DvcjLCxe3vnxXnztaY/LKUdZgzGE00V4zbic8LJ3tMrbGcJSwMp6
         XEE6ij/pODvInawzRcQ1O2R7re3yb0jvVsUXOGCGHmElDP7g+9ERuEy4c9rc0bsD7B6M
         01Y5Muw08UOBukJuZM+RIK1rq9e+MuEeC4pO0N2PaC9GdmnZJC2mdNe4p98md7zrOT4K
         SFAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C2Z2gkTr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t23-v6si1128481qtq.146.2018.10.15.12.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 12:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C2Z2gkTr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC8X5-0002Fj-Hf
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 15:28:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC8Wx-0002F6-8N
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 15:27:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC8Wu-00067B-92
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 15:27:55 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33010)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC8Wq-00065W-WB
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 15:27:51 -0400
Received: by mail-pf1-x444.google.com with SMTP id 78-v6so7802810pfq.0
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 12:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vEeuctvZqqak6vDqO4+JW7AqOcEZtccnGCFudBjM+v4=;
	b=C2Z2gkTrfA4/XCeHuQKfnnGzZQE5bLxKauf7pHgoPIXtmkAlLMEtkp12hl8PaMXcBB
	eABsgS2RzatvoaqhfOZsSWZ0SPCCxj6E4oGI/7zVmx3fwX8fCs18RGmfQPUimIzXVBJw
	t/qfns/XApOdQj/zR4icUpxDkUTkrpH2dGONo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vEeuctvZqqak6vDqO4+JW7AqOcEZtccnGCFudBjM+v4=;
	b=WV+XCnUVvGs1poJ6W7b6e4drItA4uJConpFRbEHoxhq+JaflqflURZCoAq3/tWrscO
	YKtrBegOip2twjif0Q6guOO9q26fWdTWoBF4ATWlzyg7ffC8oPrqCi5GBaTHBadVq9OT
	TU+WFcPQ0x0VxIKOnkiHVdkP2vuQb6imuwMBhuebYfxgZFgLiCQG35ZN/I/KODbOqpZg
	Wq02wsNTD3QVv2wg2hOr1YDUCyYF9Mn+5XrRZsR2pedV0oSRAnVJ+POhFWwjMrEA1Ifc
	KCT0UvXK7E//AeWK+3amhiZqO4r8iZqyt84PJ4jeyAY/dZ8o1SsIbuRJDGBzf+Cji2v3
	P0RA==
X-Gm-Message-State: ABuFfoglpwWG6OBITG6+uNpASdoQ44nmR8f+mds121Oki33+ZI5IXAWx
	tEohYOUJ1XzrfuVRq+2QWANC1A==
X-Received: by 2002:a63:2f42:: with SMTP id
	v63-v6mr3118775pgv.202.1539631667318; 
	Mon, 15 Oct 2018 12:27:47 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	n17-v6sm15156119pfj.84.2018.10.15.12.27.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 12:27:46 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-3-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0f98dc0e-99e9-af34-eadc-8aa3436a723f@linaro.org>
Date: Mon, 15 Oct 2018 12:27:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-3-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 02/14] target/arm: Mask
 PMOVSR writes based on supported counters
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
X-TUID: GYK8b4l2MvSX

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> This is an amendment to my earlier patch:
>     commit 7ece99b17e832065236c07a158dfac62619ef99b
>     Author: Aaron Lindsay <alindsay@codeaurora.org>
>     Date:   Thu Apr 26 11:04:39 2018 +0100
> 
> 	target/arm: Mask PMU register writes based on PMCR_EL0.N
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

