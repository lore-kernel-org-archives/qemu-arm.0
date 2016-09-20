Received: by 10.80.163.71 with SMTP id 65csp1145644edn;
        Tue, 20 Sep 2016 10:52:14 -0700 (PDT)
X-Received: by 10.237.55.97 with SMTP id i88mr36787098qtb.52.1474393934659;
        Tue, 20 Sep 2016 10:52:14 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o24si24959389qko.217.2016.09.20.10.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Sep 2016 10:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmPDK-0001Pu-1q
	for alex.bennee@linaro.org; Tue, 20 Sep 2016 13:52:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOsz-00032b-CR
	for qemu-devel@nongnu.org; Tue, 20 Sep 2016 13:31:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOsy-00076n-Cv
	for qemu-devel@nongnu.org; Tue, 20 Sep 2016 13:31:13 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:34779)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOsx-00076d-VQ
	for qemu-devel@nongnu.org; Tue, 20 Sep 2016 13:31:12 -0400
Received: by mail-vk0-x231.google.com with SMTP id o139so45277183vka.1
	for <qemu-devel@nongnu.org>; Tue, 20 Sep 2016 10:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xmDuIPqef9MYXj2qFOEKJFeIVKZRzDHXSPJ37SALSsI=;
	b=OLLAfGIQdON53UB7DoRru1qvPFwCEZF9bj3Ws27eCL9sxpmTVjo1JxxKF5bcqNT23K
	ORRrF23T5/C0k/1TbXDYiyUr+vhlSxv4JpgRw0BLfF/3NHHELOoF778V7CH2B2PbSsPr
	ovRGJzE/vqp1KVGJERskMw1W7T8tc0kPDN8SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xmDuIPqef9MYXj2qFOEKJFeIVKZRzDHXSPJ37SALSsI=;
	b=g/yZcsVWCqTotRtySDTu+B+kmTBxrQ8w+tPdRZxAeJgpb9MoqgEPwTby8ZPxZ/dZaU
	5vjiMYkinz/deddovddZej8gqneF0vNSk7vAupN1BeR0BhkQd3FZL6DJvkcATe7SlJHc
	+N2OWY1h7D8I3a5sT7cBlQWU6MZ/eIcy2fv+m85Ega5XE2Il4+JF3Tz/u2Q1a9H/yEog
	AfFGrnYOXakGYsB08sZd6y9Hx6ujRfVYI5ifZSSFHj+UEmmiVuMY4dnLy1qpdN3lWmkw
	JbY9cgKsIz4+494E8LurqIR9OYkplgs4kusfs5i/S/JBEDPRHJzEr0dsWroRJS5f3e6o
	NQEQ==
X-Gm-Message-State: AE9vXwPnrLih8+0CgEtjdUvtZIbegCyXXL8loNDJBnWko8dr+Ew0q7HwDlBq2tJHpHlWCbNuuNoq0jBS2hXU+nuM
X-Received: by 10.31.61.141 with SMTP id k135mr4408964vka.170.1474392671483;
	Tue, 20 Sep 2016 10:31:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Tue, 20 Sep 2016 10:30:50 -0700 (PDT)
In-Reply-To: <CAKmqyKPCoeoM945hsokDUWPvfaRJxYg=ve5DWZebuDqwfc8PyA@mail.gmail.com>
References: <cover.1469727764.git.alistair.francis@xilinx.com>
	<CAFEAcA_PWX=6HhzP2nBOn6kF6oMu0ZyDry4N4BCBcv7UQKiN2w@mail.gmail.com>
	<CAKmqyKPCoeoM945hsokDUWPvfaRJxYg=ve5DWZebuDqwfc8PyA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2016 18:30:50 +0100
Message-ID: <CAFEAcA9QtrQT4xTX_KTtxM7sPKGVZy-SrnemFgCOn7Yk+JqdaA@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-devel] [PATCH for-2.8 v4 0/6] Add support for Cadence GEM
 priority queues
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bi9Q6BvnVs6q

On 19 September 2016 at 19:16, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Mon, Sep 19, 2016 at 11:08 AM, Peter Maydell
> <peter.maydell@linaro.org> wrote:
>> On 28 July 2016 at 20:00, Alistair Francis <alistair.francis@xilinx.com> wrote:
>>>
>>> This patch series adds initial priority queue support to the Cadence GEM
>>> device. This is based on original work by Peter C, that has been ported
>>> to the latest version of QEMU.
>>>
>>> There is more GEM work that I'd like to upstream after this, but I
>>> figured this a good place to start. I have done limited testing on the
>>> Xilinx machine, including running some of our GEM regressions, although
>>> they don't cover everything. I can't really think of too many other test
>>> cases that I can run at the moment.
>>
>> Hi -- I just found this in a random mail folder I forgot to check
>> very often -- I'm guessing it's still relevant and I should review/apply
>> it to target-arm.next?
>
> Yes, you fully reviewed it during the 2.7 freeze. It should be ready
> to apply to master now.

Applied to target-arm.next, thanks (and sorry about the delay).

-- PMM
