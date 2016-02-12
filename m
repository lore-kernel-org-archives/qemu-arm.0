Received: by 10.25.159.19 with SMTP id i19csp898041lfe;
        Fri, 12 Feb 2016 07:48:54 -0800 (PST)
X-Received: by 10.140.18.136 with SMTP id 8mr2756625qgf.64.1455292134650;
        Fri, 12 Feb 2016 07:48:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n17si16308698qkl.88.2016.02.12.07.48.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:48:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFxm-0001GP-6z
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:48:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aUFxj-0001Dy-Pk
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:48:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aUFxg-0005mZ-Bc
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:48:51 -0500
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:34901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aUFxg-0005lo-3L; Fri, 12 Feb 2016 10:48:48 -0500
Received: by mail-lb0-x244.google.com with SMTP id dx9so3748990lbc.2;
	Fri, 12 Feb 2016 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=nLF3yGI/ai65x4Ct9G40yVYziYFo7v1llnhs65jc8T4=;
	b=YLHd802G94UFi89xdOhe9t4UJdmuGy8a1FRpYa8C5kLrAPfICIktFEWUIYj99C8Gtk
	JKO6DGK0ivf/0q+knKX9/Fsn9VL87JO4cP51RfB3AmD5FZDxN/5nmL7GMna3TOfcinY2
	tv3WHmfAlU5iSCg1xIcoxJh7eQdlaX+CggbRNYPhkMDkbty59/q4eJ5jj9/s+PZHHRKa
	7Zp0AfKQxW39trqn3ZCxYryy+eY74rO5TQY48B4tCUqhUFbSCuX8vKfwQuUNXVz6bk9g
	1KEDRB/TyCfHsHtf7qzFHy5zhoENcm0Y11MEnxwyNeyIarFRMm6vKuLM4BWt+C32/UDH
	OR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=nLF3yGI/ai65x4Ct9G40yVYziYFo7v1llnhs65jc8T4=;
	b=DWl155ZewhWoCYakdC0DNZNks6YpoFeFWbsl9o+P/eFEc0A3w3uG75UtJpSeZ6E3pF
	+1DvkC2GigJ1bd0y50ytl/yY6irQ0TCyD4TDqoQ6Kfon/mTHRnmEuAA9f4NaFOURu7Md
	f/eZpGRxubgP7wWfUmEKHMkpGwyVKZkMNm8BxPgldp40vTTZR7LwSVunu8ofVjG+UHy9
	TkIkF5PHbMYg3VRI2s3+g3OhlyJtMJkj/4kskrSrViJjjbxwBbKLRSifuwHjWcQVlJy8
	XGAKoAkW4cpEpI/UU2aIcxC/0fbepmtuxslVFGnL7M34dpwdjegGWq4RF8DtvP3BpV37
	Tp3w==
X-Gm-Message-State: AG10YOSgk3Kd8v+6S6CoitBQjUnzHva5hbg6I6cCWt4ZJTeF/60L3GT8ytUlZU6NdpSlEg==
X-Received: by 10.112.73.33 with SMTP id i1mr940773lbv.6.1455292127152;
	Fri, 12 Feb 2016 07:48:47 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	ot1sm1961071lbb.26.2016.02.12.07.48.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Feb 2016 07:48:45 -0800 (PST)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-4-git-send-email-peter.maydell@linaro.org>
	<20160212151218.GG31433@toto>
	<CAFEAcA_00+sVTot-q5iHKLDiLbPRFsRTBQNE4Dbswt1haaxwGQ@mail.gmail.com>
	<20160212151608.GI31433@toto>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56BDFEDC.4030107@gmail.com>
Date: Fri, 12 Feb 2016 18:48:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160212151608.GI31433@toto>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 3/4] target-arm: Combine user-only and
 softmmu get/set_r13_banked()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /s2AK/mj87MX

On 12.02.2016 18:16, Edgar E. Iglesias wrote:
> On Fri, Feb 12, 2016 at 03:15:22PM +0000, Peter Maydell wrote:
>> On 12 February 2016 at 15:12, Edgar E. Iglesias
>> <edgar.iglesias@gmail.com> wrote:
>>> On Thu, Feb 11, 2016 at 07:11:48PM +0000, Peter Maydell wrote:
>>>> The user-mode versions of get/set_r13_banked() exist just to assert
>>>> if they're ever called -- the translate time code should never
>>>> emit calls to them because SRS from user mode always UNDEF.
>>>> There's no code in the softmmu versions that can't compile in
>>>> CONFIG_USER_ONLY, so combine the two functions rather than
>>>> having completely split versions under ifdefs.
>>>>
>>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> Hi Peter,
>>>
>>> Do we really need the assert?
>>> If we keep it, can't we have it for both -user and -softmmu (avoiding the ifdef)?
>> I would be happy to entirely drop the assert, yes.
> OK, thanks.
>
> With that change:
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>

Yes, I also think it would be okay to drop that assert. Anyway:

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>
