Received: by 10.25.208.211 with SMTP id h202csp1646553lfg;
        Tue, 23 Feb 2016 02:38:44 -0800 (PST)
X-Received: by 10.140.253.2 with SMTP id y2mr42754839qhc.89.1456223924408;
        Tue, 23 Feb 2016 02:38:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7si33258191qhs.63.2016.02.23.02.38.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 02:38:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:55829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYAMd-0006Ge-Sj
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 05:38:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYAMb-0006Fa-Fg
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 05:38:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYAMY-0006T3-Az
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 05:38:41 -0500
Received: from m12-15.163.com ([220.181.12.15]:40251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aYAMX-0006SV-Cd; Tue, 23 Feb 2016 05:38:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=kjL0w
	2rS9ZPhmbf0jZ0pEX/ew+JlhGCW8yGqsBHP2tM=; b=ZXs3ZmqpbKGx8hrS33TTT
	gQCIS1cADXIqNlFsBVazRFxk1KHq7wK4O/fBeIzWOjv+ezlSfSTy+jM784H6okE3
	mEwzUBFua2mQCfIFW2HPYbemiL02KpLlizZGs7zVLm2am/Ra/kNaMMUAgM4UVqrr
	870of5iEheD5jyY7f6KAU0=
Received: from [192.168.31.184] (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowEA5C0FrNsxWKtphAA--.15791S2;
	Tue, 23 Feb 2016 18:37:33 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456132310-4826-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA-sDDj=kKmQnru0nfrjuHSjD8KDzO-PWGd0ia3GMZrEdg@mail.gmail.com>
	<56CAE2DB.3080702@163.com>
	<CAFEAcA-nbrRN7ecP9G4O-bj=K-NtKoOQXpxGygKMPgxpgxQvBA@mail.gmail.com>
	<56CBEA1C.4060900@163.com>
	<CAFEAcA86KRN5eS4p6frpP5XnxUE69nXB3aQ6=W3zKE+j1RV8nA@mail.gmail.com>
	<56CC2E1E.2050705@163.com>
	<CAFEAcA_2eLMd39Duufk-u8VZ9UFnjPfqDFHo=QFk7qJaK4bCKQ@mail.gmail.com>
From: hitmoon <zxq_yx_007@163.com>
Message-ID: <56CC362B.2080907@163.com>
Date: Tue, 23 Feb 2016 18:36:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_2eLMd39Duufk-u8VZ9UFnjPfqDFHo=QFk7qJaK4bCKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowEA5C0FrNsxWKtphAA--.15791S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFyxWryrKw4xKw4ktr4UCFg_yoWDXFb_u3
	4kZrn7G3yDGF4qvay3JF48Za93Ca1xWF98Ww1Fqa4vvw1fXw1xCa1qkryv9rW8XFs3Gr12
	9FnYvF1xAFnF9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn-Vy7UUUUU==
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEg4YxlZXwONRTgAAs-
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v4 5/9] hw/timer: QOM'ify m48txx_sysbus (pass
	2)
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
X-TUID: bRNsafgAmi2Y



在 2016年02月23日 18:26, Peter Maydell 写道:
> On 23 February 2016 at 10:02, hitmoon <zxq_yx_007@163.com> wrote:
>> I still can NOT understand your intention properly. Can you explain more
>> clearly?
> VMState structures should generally mirror the structs
> they are saving/restoring. The M48txxISAState has an entry
> that just says "state is an M48t59State struct. Your
> VMState for M48txxISAState should therefore also have an
> entry saying "state is an M48t59State struct", it should
> not manually include all the fields in state. If you
> look for uses of VMSTATE_STRUCT in the codebase you'll
> find some examples.
>
> You also need to be able to test that migration works
> if you save data on a QEMU built before you make this change
> and then reload the data after it. So you need to find a test
> setup which uses this device (ie a working command line for
> a machine that uses it, preferably with a real guest) and make
> sure you can do vmsave/load.
>
> thanks
> -- PMM
  Got it !
  Thanks PMM !

