Received: by 10.25.77.4 with SMTP id a4csp328230lfb;
        Thu, 9 Mar 2017 02:28:23 -0800 (PST)
X-Received: by 10.200.0.153 with SMTP id c25mr13500267qtg.177.1489055303455;
        Thu, 09 Mar 2017 02:28:23 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id i20si5340974qta.138.2017.03.09.02.28.23;
        Thu, 09 Mar 2017 02:28:23 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id DCF9040625;
	Thu,  9 Mar 2017 05:26:57 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EcqzhfHh7MZy; Thu,  9 Mar 2017 05:26:54 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 68F4340A54;
	Thu,  9 Mar 2017 05:26:54 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 654B040A14
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 05:26:53 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHPT+1Nj8Xgs for <kvmarm@lists.cs.columbia.edu>;
 Thu,  9 Mar 2017 05:26:52 -0500 (EST)
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 151A440625
 for <kvmarm@lists.cs.columbia.edu>; Thu,  9 Mar 2017 05:26:50 -0500 (EST)
Received: by mail-wm0-f43.google.com with SMTP id n11so52336392wma.0
 for <kvmarm@lists.cs.columbia.edu>; Thu, 09 Mar 2017 02:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4PP7fJwVo1Zp1J623zrzcNAz/ihhmWBBSdFwve2VS+k=;
 b=L95PRxb43ZRgYuJQjUp0sJJBUtvDE/UAPewDtao1BQpstUXL2kqyQexk1xYX5sC2BY
 Ktb1pLRPbG84ijPPfvR7xfVfywMe8/aYxOEaDJg29KKokClGgFQI8frgbtn8GIqezBKV
 NP/FWq74ehqmCrRqtA+w/16zVDY9L0XWRXATs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4PP7fJwVo1Zp1J623zrzcNAz/ihhmWBBSdFwve2VS+k=;
 b=Q8FVlmGFe9EAY/qstwPcK4tgQBhhwYKy0P6pRqbDUfp/kMUiBBwjm1QrSfvNCRnhib
 bbrjl39gGpTAOiMbE0SOG51cSXw0Cq5qBvpcvEv3Z1qAksRyxskgJ0xG5gWthcamZWRo
 FW4upADB6WwwOw96mjtL/4fHobYIuBQ+cgywCgyvDzTz2CwsCSFuk3CNhr9iLHbwZ2Cd
 wQKjNXfWHyyHqj5S5772ETHqsbL7gCDvPD/8Qh5r7y8aPXQqrpp5rBdqs05T2eqEfDc+
 5rs8p/0t9eYXO3JbKM58EkfadgU/QWqCHrntCBCumOPMgnBu825peg3ZbrYFaKGWl6Kp
 Zpog==
X-Gm-Message-State: AMke39kH+h4Auoqat9t9VBXjWitN34crUaHFXZsm1lROnw9bQ1ZXZST7JiaanmoqzyiOWJun
X-Received: by 10.28.20.148 with SMTP id 142mr10136403wmu.134.1489055295225;
 Thu, 09 Mar 2017 02:28:15 -0800 (PST)
Received: from localhost ([109.74.56.122])
 by smtp.gmail.com with ESMTPSA id m80sm8200319wmi.34.2017.03.09.02.28.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Mar 2017 02:28:14 -0800 (PST)
Date: Thu, 9 Mar 2017 02:28:12 -0800
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [PATCH RFC 4/7] ARM64: KVM: emulate accessing ID registers
Message-ID: <20170309102812.GB114809@lvm>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
 <1484559214-2248-5-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1484559214-2248-5-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: marc.zyngier@arm.com, qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
 wu.wubin@huawei.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: ywJsvlMrTAHG

On Mon, Jan 16, 2017 at 05:33:31PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>

Please provide a commit message.

Thanks,
-Christoffer
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
