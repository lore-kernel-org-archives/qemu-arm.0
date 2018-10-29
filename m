Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4683804wro;
        Mon, 29 Oct 2018 13:25:35 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fz5qq1bxhi0dyQXqfYiW6juvq4gwidCYtBvhHpOuHHcQklXfeSC5ZGcZ2yCCBtXUpXGxYA
X-Received: by 2002:aed:31a5:: with SMTP id 34-v6mr14511372qth.15.1540844735313;
        Mon, 29 Oct 2018 13:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540844735; cv=none;
        d=google.com; s=arc-20160816;
        b=PNTrpGWg/G0ALXaSotaueU6Ga2G1GEmnubYcX7i0RjXzVRAuyGDW5sPEvAOZr3cIAx
         F3u1U/fgMVETgzINkJozeMuH9MRKTPo5Ci9bvykLVp9VuuqV5mKR1hYrjT2DjOEkwK1Q
         aNafM9i6tV9Hg903v4Pw+py0Kzb4KUiFrMlvr8Cr1xExCQnPiNdx0D3qem+edapsKp0J
         IdIu2uQNwCT4FQ9TQy38ChaUAntS7l+gzPelOxhu8ifWGLFloM+mlvX42UdoNf0O40ba
         +wj/6kYJz6vOVyEsR0H/g8m6zBkGkuI4fs0n706O+A81gE2IXuiCNRJ8fo0yF9WVgarQ
         PhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=tApPbU1CksRorRhQ+EpVZZWvUA+hkwiCQSe7WvL7QF0=;
        b=nqVvUUcPCaSioLgSx4QQ4TAr/NmyIs0KVPO/B0TvkLrP7LHVq2nDrULrGJlgc6ARJN
         CuUYneJdutuJevLGLp5vb0jik9WmbDV7rQ039nwT+94pZ/j0LSYCgTBINj+5Kx6Q0f16
         Uz6VRHEUmbtSxpMgvAKaStgle90PTh1RFZq6A4czPBUJrHC9RquTNtOEQ++CVffkmYVY
         LG3POsFH74iGsGtlo3GPkdry9gZWJXXJJHZcBl46SDfyf5PW/DHppcz6Efv23ZJcEuIP
         V0J9tn2Lhcki5c06ACDBHeBo/qYsHw3WcsRGjyADLR0kLE7Ht4R7AZO8dmF5Pxz42o+D
         4gWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EJ3lsrZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t68si725141qkb.23.2018.10.29.13.25.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 13:25:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EJ3lsrZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHE6Q-0007QU-PO
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 16:25:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gHE5m-00076s-Ud
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 16:24:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gHE5m-0001TG-1p
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 16:24:54 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42732)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gHE5l-0001Ot-PW; Mon, 29 Oct 2018 16:24:53 -0400
Received: by mail-pl1-x643.google.com with SMTP id t6-v6so4351061plo.9;
	Mon, 29 Oct 2018 13:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=tApPbU1CksRorRhQ+EpVZZWvUA+hkwiCQSe7WvL7QF0=;
	b=EJ3lsrZL47nZs+F9Po8+bvg5UngBZtmxvFTG+xkCxhxV8CGB/OrMXTqvcBQ+Xl23gb
	Cyq6kxQTh4jW7TGxeDxN4b5JKmz5zQo1GQrvFpIyAyErcr5PkNrijv7QqnixCiiTazPe
	26fRs5TjY0THSYBoH9kIr8G9Y+v+nqcqdzPiy9GrKPheHaqEQm86SfWNS1JaGOvlQY9n
	7b7EsiBHSsUQ3V5W+ZM6p42IGBKVUNMcFyxq1JZ9rDPZcDdujrAnhhNj44BrK7H/BmMp
	fEJZwxDemgbXGMqLgA5GE7CTV6H8yQUQB/LX4Xxivm0G4+5wOi8baiKp4PCgN2paZZ0+
	LmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=tApPbU1CksRorRhQ+EpVZZWvUA+hkwiCQSe7WvL7QF0=;
	b=tOdYSzAf+JVJSYR2lDT/Zpy2oP+QimBtc3AeqgaC84EcUP+RkHIZ2uMiw5yzziGnfm
	6FmSjvAKmw748Cnb6aQ27N5B7MAbD4CeP/JWHZ08wURVsXwFEsj8VoegyyN4odQ7Omdg
	XNDfUxeTfj2t30AZBSZVTRGpsBQ65md88KVr0jNE6bJcjA0zEAqkNziFlHHGWy69NSlb
	NUm8HCyWV0RdA7zFZvVprns7D6VFffFuCmspj1gzLTuEVt0cODmJMAtCvmx8QdUR9qTv
	Y6OWdpmktKYBRllVi0x1xgF3yeWkjsXZOiJAfDOe3B7aRnkN750Q47OLwJzCU2i8kE5B
	Fixw==
X-Gm-Message-State: AGRZ1gLCcYxvY4/eXLP9BzoXEZzMV6JSSdoEhJ7gvXlI+VLsiWzCmzE6
	mX7aaktkJSLyaSgWEMTa4dg=
X-Received: by 2002:a17:902:bc8a:: with SMTP id
	bb10-v6mr15449195plb.99.1540844692829; 
	Mon, 29 Oct 2018 13:24:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	n26-v6sm5010658pfh.166.2018.10.29.13.24.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 13:24:51 -0700 (PDT)
Date: Mon, 29 Oct 2018 13:24:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20181029202450.GB24689@roeck-us.net>
References: <1540548409-22560-1-git-send-email-thuth@redhat.com>
	<CAFEAcA8EubWya8ey9VxhaCw4m2U=KA+i2C-R9P-p+P6oEBBLew@mail.gmail.com>
	<7fc49925-36ff-bd9a-0cd7-e5f8d4bb3672@roeck-us.net>
	<CAFEAcA-UF+SyXvcU+NGZsbqBF2qg+s_x4HPU7yvf7B2G-=HPOg@mail.gmail.com>
	<b4f6cbd2-68fe-5b07-e8fb-93b1c4d8a6de@roeck-us.net>
	<2eb2b4ef-725d-cbee-1676-feb6bd800aea@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2eb2b4ef-725d-cbee-1676-feb6bd800aea@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] Deprecate the "collie"
 machine and Strongarm devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EIwACD21mZVI

On Mon, Oct 29, 2018 at 04:03:40PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Guenter,
> 
> On 29/10/18 15:09, Guenter Roeck wrote:
> >On 10/29/18 6:24 AM, Peter Maydell wrote:
> >>On 27 October 2018 at 12:04, Guenter Roeck <linux@roeck-us.net> wrote:
> >>>On 10/26/18 3:12 AM, Peter Maydell wrote:
> >>>>Hi Guenter; there's a proposal here to deprecate (and eventually
> >>>>remove) the 'collie' board (strongarm) from QEMU. Is that one of
> >>>>the ones you're currently using in your automated testing of Linux
> >>>>kernels on QEMU?
> >>>>
> >>>
> >>>Yes. I can run the test with older versions of qemu, so it is ok for me
> >>>if it is removed (as long as that removal is not backported).
> >>
> >>Mmm, but if we have an active user who's testing them then they
> >>probably shouldn't be in the frontline of boards to remove.
> >>Which other boards do you test with mainline QEMU?
> >>
> >
> >For arm:
> >
> >akita
> >ast2500-evb
> >beagle
> >beaglexm
> >borzoi
> >collie
> >cubieboard
> >imx25-pdk
> >integratorcp
> >kzm
> >mainstone
> >midway
> >mps2-an385
> >overo
> >palmetto-bmc
> >raspi2
> >realview-eb
> >realview-eb-mpcore
> >realview-pb-a8
> >realview-pbx-a9
> >romulus-bmc
> >sabrelite
> >smdkc210
> >spitz
> >terrier
> >tosa
> >versatileab
> >versatilepb
> >vexpress-a15
> >vexpress-a15-a7
> >vexpress-a9
> >witherspoon-bmc
> >xilinx-zynq-a9
> >z2
> >
> >Though not all of them are supported by upstream qemu. For some of them I
> >carry local patches,
> >for others I use out-of-tree versions of qemu (beagle/beaglexm).
> 
> Are these patches upstream-able?
> 

Some of the patches (eg to be able to boot a Linux kernel image for mps2-an385
directly from qemu, or zynq CPU clock rate changes to be able to do the same)
have been rejected. A few patches were submitted at some point but got lost.
I don't keep track, so I don't know the exact number. For some patches, such
as basic BCM283x CPRMAN support (needed to boot raspi2), a better
implementation was suggested, but didn't go anywhere as far as I know.

Some machines, such as beagle support, are from Linaro's tree and were never
upstreamed by Linaro. The Linaro branch is based off qemu 2.3, so applying
the changes to upstream qemu would be a major effort. I also use the m68k
branch from github.com:vivier/qemu-m68k.git for m68k tests.

I carry some 20+ patches locally in my qemu tree. Some may be obsolete or
not or no longer needed (my understanding of qemu is evolving). Sometimes,
if and when I find the time, I pick some and try to upstream, but I often
don't follow up if there is no response or if the requested changes are
too substantial.

Please feel free to have a look at https://github.com/groeck/qemu
(check the <version>-local branches) and let me know what might be
upstreamable. I'll be happy to (re-)submit the respective patches.
Note that I won't be able to make any substantial changes, though.
Time is a scarce commodity nowadays, unfortunately.

Guenter
