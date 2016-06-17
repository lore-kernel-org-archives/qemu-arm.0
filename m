Received: by 10.25.21.96 with SMTP id l93csp377473lfi;
        Fri, 17 Jun 2016 10:49:28 -0700 (PDT)
X-Received: by 10.237.36.220 with SMTP id u28mr3981890qtc.30.1466185768388;
        Fri, 17 Jun 2016 10:49:28 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si32350140qkh.47.2016.06.17.10.49.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 10:49:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDxtX-00046i-PY
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 13:49:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDwgK-0003To-5N
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 12:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDwgH-0002Ph-T9
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 12:31:43 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDwgG-0002PN-ME
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 12:31:41 -0400
Received: by mail-vk0-x231.google.com with SMTP id d185so122797516vkg.0
	for <qemu-devel@nongnu.org>; Fri, 17 Jun 2016 09:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jkFmEtfLbBG97N1tL1Q3dMid3ayPZCRUELhk4YkQq0c=;
	b=AbWRAJZHDtpw3qaenGiMlD2ye0ourxJjUCIwWcYyA6Mpvb8qdrrgsgpkvbRJ4QzzUQ
	Bpke+2COSArexOwvTYOAMmXUwF1+mPxw9+iDhGaaOGE9Rts+zEKMX4E99RkXlJo3dv4t
	RioNs/vayFubp87VSd2q3cqPV0kqGjn7UMz/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jkFmEtfLbBG97N1tL1Q3dMid3ayPZCRUELhk4YkQq0c=;
	b=TdqLIopCLoUjevNYSzkHO1xP1gMt287fkAsrQU+WKXiGSDmdwp2UUBIaISOAPFzsxF
	F+pKXjA8Se2xpXGi/iXv9h95SY/9DJQF4CnJ96KnsdZcwF3X4LZW/i+MiEueRp67ZE6j
	zToC6VlgPfWGRYcmvseD8hV+nHenLs+aOVeNBhNiqqzetWeM1wlarttLg+b7Aydge80V
	UbXJurTjkBe5OuCTRwCa8eYW/GkSpmSolNyRZ8JDqsASfYD5LX21vS4u3ogSU0yqi/i6
	XWUPy93rQpjW92Tz+ZxH0mxq/ZD4R9tYX0WoD4Yrb5kKufuuKpCvhHFL9D4Z+qbcyzmq
	7JTw==
X-Gm-Message-State: ALyK8tK/Z9hKQOJ/jocyW3P9ZgrzSBYSyK7H92Fel19cIhzhDuqwGsMAWqbC4WJknu53HW2pV188P3qNzURBF3vB
X-Received: by 10.31.228.133 with SMTP id b127mr1504351vkh.90.1466181100162;
	Fri, 17 Jun 2016 09:31:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Fri, 17 Jun 2016 09:31:20 -0700 (PDT)
In-Reply-To: <20160617161016.GU16797@redhat.com>
References: <b1b3b0dd143b7995a7f4062966b80a2cf3e3c71e.1464273085.git.crobinso@redhat.com>
	<20160526144629.GH28935@redhat.com>
	<CAFEAcA-G4rL8o-6gmQvXHMVUrvH9utZOQuFhDO=J9imtzophjA@mail.gmail.com>
	<CAFEAcA8QmK+_cHfPuk90poixxbqSJpb+OuoXg-3OnXcfRYKQUg@mail.gmail.com>
	<20160617161016.GU16797@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jun 2016 17:31:20 +0100
Message-ID: <CAFEAcA931Pn7jbyRF-G5jGSi=h7CjV3j7v7Xvpb8rbPttVJKvQ@mail.gmail.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: Reject gic-version=host for
 non-KVM
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lB234LZrpbd+

On 17 June 2016 at 17:10, Richard W.M. Jones <rjones@redhat.com> wrote:
> On Fri, Jun 17, 2016 at 03:49:38PM +0100, Peter Maydell wrote:
>> > I agree that we really need to do better here (thinking about
>> > the problem is on my todo list but generally other more pressing
>> > issues intervene). I'd welcome suggestions for semantics which
>> > (a) do what you want (b) are reasonably in line with what we do
>> > on other host architectures (c) don't break existing command lines.
>> > (I think those are the main requirements.)
>>
>> ...so does anybody have any concrete suggestions? We could fix
>> this for 2.7 but we're starting to run low on time for that.
>
> I have changed libguestfs so it tries to guess if KVM will be used or
> not.  We have to do this for the -cpu option too, but the guess is not
> too reliable.  Only QEMU has the actual knowledge we need.
>
> https://github.com/libguestfs/libguestfs/commit/7023f20830a681ef36f8f99415fe41791555a3db
>
> Can we not have a "give me a GIC which will work" option, eg.
>
>   -M virt,gic-version=besteffort,accel=kvm:tcg
>
> I don't care if it's not the fastest or most featureful.

Do we also not care if the result is not consistent
between versions of QEMU? (eg if you go from 2.6 to
2.7 does it have to stay doing the same thing it
always did?)

thanks
-- PMM
