Received: by 10.223.172.38 with SMTP id v35csp551014wrc;
        Thu, 7 Sep 2017 11:14:30 -0700 (PDT)
X-Received: by 10.237.33.175 with SMTP id l44mr319570qtc.141.1504808070695;
        Thu, 07 Sep 2017 11:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504808070; cv=none;
        d=google.com; s=arc-20160816;
        b=KO745wEdC0qFSb6sJCtZS7jm2OhqKbDtkpANBSBTEyGNrdzKZ4BwpHkP0EaQJWBsi8
         VuF1ZldCtVKJGznodnjpINFQdkKKnaMfyqlIHoEGQynhViI2aYDbIiAnE0++PVbJDi4y
         ZtObx9roqswb2y6kGvO+VVBacQeId0MPtcLU5+KR+E10JKxXAAOfb7yI14vmzS6rCQRV
         uFvEKVwazKwMSSTOcA7GBWDZogkW2PuenI/1sI8sj3N0dUoIMm5T3e+OkZrrPajh4F1W
         dcrmcrVxPQYPPf4Z1bvLSrCTqw3bA+V50zvSdHGCmwiOSZLjKzwN8MqOjns2rQM8wmWr
         jieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9TlLXvLNCcHE7W+qf4zOWA7d7i8EfExuP9SlKJWn2jw=;
        b=kSBNFGdfrl4Zzs5siSQMOCmZByaw0LTJdoNgn6kS7fJflR/dPsSFblSCxCSXuVtFoL
         pkbeBd5FXgRIACqlhwmDRle5CCMOklVrxznwGWYqhpq5tzg2kJpHgEQ1U07EU5dhkZlv
         HVdkEvahzjPXyzzHY/w67ZKdsZZ3iiZb6pplx5DRaZ23XMv3qw4BOB7VCYtkhQAv3GXK
         CEBPaYHW7zpeKwaTEedA3VH7ftBDvhiHGsBOxlCACWMwJbbrR2FpA/TiObUKCBH3mjdz
         xuTrOo198BvbBgiEVnlLjsW8UvkZhwd4X03AMgV1PoQS/Vl6mhujyydHzmjmnL4aTqf4
         yAMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T8y2nRe5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x20si306743qtk.126.2017.09.07.11.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 11:14:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T8y2nRe5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dq1Js-0000vE-FB
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 14:14:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dq1Jk-0000uk-48
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 14:14:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dq1Jf-0004gW-Cq
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 14:14:20 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:38429)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dq1Jf-0004ft-65; Thu, 07 Sep 2017 14:14:15 -0400
Received: by mail-wm0-x242.google.com with SMTP id x17so223081wmd.5;
	Thu, 07 Sep 2017 11:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=9TlLXvLNCcHE7W+qf4zOWA7d7i8EfExuP9SlKJWn2jw=;
	b=T8y2nRe5OFzkfGjgHBAGBJVy0VMY3oJLNyuYheTgfvFQYx5tSYjAu9/BIpsJeFjB6Y
	lpNMtIhOfIhYPemo3kbRZ3jLyVICJBIGRG/IHPJi0l7kN1PoQ5PsoCkOv8ayW86kC+hI
	/tpJ4kcEprD++hD4V7wnVwMJAl7PnOfKc1qPHmLxeXlJ3stiCM/F5hgsaW5iJthahQPV
	7UTK5EfIR9SkOMw1pMrro0GtDS6hNRL1bLLU2K8IKst7DGZZtAK8AxgNEKUK+cH3AnJY
	399h0TPGvIck1HJZz05H+vB51VZlUBcM2zfC/uHGBDRTkZSXQbRkNM6yeIVuhfcdPASK
	Ky9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=9TlLXvLNCcHE7W+qf4zOWA7d7i8EfExuP9SlKJWn2jw=;
	b=GmdEHQm5yRyotX3KAXt7kffjHjZCKtHZXCM3F7BwUfuQUKFn64hFQdnpclLo3pnfti
	yzrZNGXvW6NFKS6UiqX+aDjggJD2fWTQUN+EqN01Gs+WeMOgF6FMDTOzXdAas/VabIQt
	bJci1BLCKlXePBNraYeBZgH5Hk53y1msRpQcTLJiF4UgYol9igjVO2qhv0Oah9/i2pVt
	C2QgfHEVICw7tuWstdqNqOKBcxnCBU5t5T4aqgJt9bQDiJWwJ062uiQT7N88h8RgN3qB
	JuANqnQTyj3W+xqIeXeAlFYE/ewUq5gPqjnMAe7Cs2mnCa0ZDK07iKm4wCKjO4dqHP66
	Ci+w==
X-Gm-Message-State: AHPjjUgYm5rJMpvNwujnYIXQeLYIDk4Z0qQF2pgi5JFnLKNhZwiQYdns
	UvEjXSWvgOLXxqruxTWCNtCmE5OKSA==
X-Google-Smtp-Source: ADKCNb5LPSBe+4nWdjUiNGNAvbI8WJpl1xV3RDaMZfMkZBQV9kAXdbYazhmBMGYn/sZtPVN7juAheg67sCkRt8fPCME=
X-Received: by 10.28.129.23 with SMTP id c23mr120291wmd.27.1504808054102; Thu,
	07 Sep 2017 11:14:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 7 Sep 2017 11:13:43 -0700 (PDT)
In-Reply-To: <CAFEAcA8e9c_kB8b-LEWNGDPoyPfrEHp4_z9cCK70gPzcaV4Wrg@mail.gmail.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
	<CAFEAcA8TSpNkz3ew+wk6K0vu18B5RCr=0vbkihcaDz8v2zUN8g@mail.gmail.com>
	<CAKmqyKMd0JcEtkqiajLd5sbWP9WpjS8XqwfGGWPuANchE5Ej3A@mail.gmail.com>
	<CAKmqyKPSm4UHL7K0ZBGF28Z+wZ0qtMLd7CSvF9W94LwsXfN9zQ@mail.gmail.com>
	<CAFEAcA_0FyFFqJ2GOtUw5CPBKTj1YR9ykroyL-7WCYfbgR0hAg@mail.gmail.com>
	<CAKmqyKOqOJJceCf-wMjZTMQCHDjHWGWT4JAdsqERVXeNtTP6dw@mail.gmail.com>
	<57594b14-dbe1-9542-6bdb-eb0b5dc1314a@linaro.org>
	<CAFEAcA8e9c_kB8b-LEWNGDPoyPfrEHp4_z9cCK70gPzcaV4Wrg@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 7 Sep 2017 11:13:43 -0700
X-Google-Sender-Auth: i8yqo7QmwFOGKWD8XPxgCAyORAk
Message-ID: <CAKmqyKNCxRq_Yc4TLrAq_3q-6XC6iCE-QDV9StW4NyeaRYpt2g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/5] Expose the secure and
 virt properties to the
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FsQZNIJZYHG/

On Thu, Sep 7, 2017 at 11:08 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 7 September 2017 at 19:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 09/07/2017 09:48 AM, Alistair Francis wrote:
>>> Hmmm... I'm not sure how to look into this then, as I can see the
>>> patches going through to my personal email address, so it's hard to
>>> place the blame on the Xilinx mail server.
>>>
>>> Do you want me to try sending out patches 1 and 3 again?
>>
>> I had this problem with one of my patch sets earlier this year.
>> In the end it seemed easier to post a link to a public git tree.
>
> Being on the direct cc list I get all the patches anyway, so
> it's mostly an issue for (1) review by other people not directly
> cc'd and (2) the automated tools (I can apply stuff by hand from
> direct email but it's a pain as I have to manually save and
> then git am every email in the set).

The patches can be found here:
https://github.com/Xilinx/qemu/tree/mainline/alistair/secure.next
That'll save you manually downloading them.

That's probably the best I can do for this series as they don't seem
to want to go through.

Thanks,
Alistair

>
> thanks
> -- PMM
>
