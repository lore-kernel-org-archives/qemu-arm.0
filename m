Received: by 10.223.188.70 with SMTP id a6csp1648350wrh;
        Wed, 23 Aug 2017 22:31:41 -0700 (PDT)
X-Received: by 10.55.103.72 with SMTP id b69mr6577591qkc.329.1503552701414;
        Wed, 23 Aug 2017 22:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503552701; cv=none;
        d=google.com; s=arc-20160816;
        b=KTzyipsnfGiZH7TH3Tz2/lHVEfXSarW61PqQcOo4KptQBO10o9fJ9f9Nufqs+JVF/2
         Zowq4nurkaHdghTt6rpTlyvAqQO/M+kyZExj15bkmGZ5Gfjtc8zYi5SEGPJJs2kf1qrI
         X6vLyEK/JoON0H18iZAu6ceJNKaQFKlMSQqPOFA0N2MvLeCBk9W/hJ8ZsxrPZ01Uw5J7
         W/5OvAPoXIk4Gyz8bQMkXaXrfck9Zm+pSMQYnO2cqLGFUTnwqTspUoJXKBgLbikCG+md
         M8+gGDEMw/ogY/cP2HeQKG3FMcIOlZ2lrJ6aAtOb6tVtt6Q3iLGsJK3vQK95NkNTx/5a
         g8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=urOGyN8b8HvtuVErrl3FqifFCs7eOksfCiAwWv/qC38=;
        b=rxS48DjbEKB7X/B8+BUBacnzQLc6E7AHZVZJtS3y6jZT9qmLfKWUmyy5cobXxntaKq
         kknU6ACT7h4Mg3xQFAh781YYNY59lOGgZmHV+o959hYKEHtLwWAwEN6G4G3zGESHO0zV
         xQ36mKBK12p/+PFxd435N7QaqUjDC/fR3hKOTh2Bx9ZVKYqaU86A2GVGwPdcbo/5v8Zu
         HNYEX3RfYHSxiCrLVO/Ij4+c1nWYJc2nGAO+Zv0nsbvbelVXi4goYUqF0uxJznMPAa7X
         weShPkQYiQrxf6amcmB8O73ROvreIVv4+mBzQs74BwkzagrpFi+bhXn+AbuapXyaXjj0
         ufug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WaF93beK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si3137743qkf.517.2017.08.23.22.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Aug 2017 22:31:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WaF93beK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkkjz-00033H-8u
	for alex.bennee@linaro.org; Thu, 24 Aug 2017 01:31:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1dkkjq-00031C-JV
	for qemu-arm@nongnu.org; Thu, 24 Aug 2017 01:31:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1dkkjp-000815-PC
	for qemu-arm@nongnu.org; Thu, 24 Aug 2017 01:31:30 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:35651)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1dkkjl-00080N-9s; Thu, 24 Aug 2017 01:31:25 -0400
Received: by mail-wr0-x22e.google.com with SMTP id k46so6451775wre.2;
	Wed, 23 Aug 2017 22:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=urOGyN8b8HvtuVErrl3FqifFCs7eOksfCiAwWv/qC38=;
	b=WaF93beKgMK199M8Q0/2niKa3zwqcZsFRBBwKMpU6+X8Y+azbjLWy/NSaz5iWpU8qu
	n2Xs5L8JdawH/tcPyG7SNM6KeubDWdALiq3lG74U91YceGdXM1nmFFb1vc86GUx8g+ox
	he4zbFDaTJ09ZvMlrDmBfD7dahj2DxQS2v1MRs68VOejOnxyJlFkpjJUsX/NFTEZ8iwF
	82KoXg+JL4Inred4/wqB2t9w/HHX0isp9gQl3G04D41/kpk8J6zNQ/zJZXbXv6he7nJ6
	Gzvsb3FkN/MreiHeMS39asmQICavLs3mYxwvnoKuQYzp2qrq0YFUE9cFwJUFk9ooQ/zP
	6tJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=urOGyN8b8HvtuVErrl3FqifFCs7eOksfCiAwWv/qC38=;
	b=a5loD+TXrfcAP9a7vXHnezMnI1mMV0GZnL/VcGl+hIISCEwEiSgPX7GBQGav00E2G+
	sjga/j/si+hHWsfCVJGe1TRwwVAe0t6EdesgcUYhwTKvLmxP8BvOrjTlIxw9M3tMhSpj
	kUCdPxeusAv97VtWl6aXedzEvOWNaIcP0KFD0Z/8q6vYDH3zYCh3XUTLZ2Ep4cpKBv4p
	8rniB0QzOu7RHb/xD/eN0es3uZDjxHOempAmrR1HSEz/C6hHeVfK4fIpkyYBkE7eSeiT
	6w96jzmJMomYiUQzYyR2j49j/ChFrHePzRtXfXnrp70iFhZS4zgTm98NNJ/u94S8KyXo
	JqwQ==
X-Gm-Message-State: AHYfb5jObEvE91x8oE8MmxPyg9aGk/wkCr6ARc47kL/cmTHQJnGWjbhk
	FHHRDq5wXnKqFc7xm60=
X-Received: by 10.223.142.168 with SMTP id q37mr3249003wrb.254.1503552682612; 
	Wed, 23 Aug 2017 22:31:22 -0700 (PDT)
Received: from [192.168.10.165] (94-39-192-75.adsl-ull.clienti.tiscali.it.
	[94.39.192.75]) by smtp.googlemail.com with ESMTPSA id
	w16sm6039311wrc.84.2017.08.23.22.31.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Aug 2017 22:31:21 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
	John Snow <jsnow@redhat.com>
References: <1503543783-17192-1-git-send-email-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7995c721-963c-2552-e1a1-767f461ae63a@redhat.com>
Date: Thu, 24 Aug 2017 07:31:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503543783-17192-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-arm] [PATCH for-2.11] hw/ide/microdrive: Mark the
 dscm1xxxx device with user_creatable = false
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
Cc: qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /QIQg3gn3TCE

On 24/08/2017 05:03, Thomas Huth wrote:
> QEMU currently aborts with an assertion message when the user is trying
> to remove a dscm1xxxx again:
> 
> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
> QEMU 2.9.93 monitor - type 'help' for more information
> (qemu) device_add dscm1xxxx,id=xyz
> (qemu) device_del xyz
> **
> ERROR:qemu/qdev-monitor.c:872:qdev_unplug: assertion failed: (hotplug_ctrl)
> Aborted (core dumped)
> 
> Looks like this device has to be wired up in code and is not meant
> to be hot-pluggable, so let's mark it with user_creatable = false.

The hotpluggable flag should be just a hint from the device, independent
of any knowledge of the board's behavior.  So a better question is why
qbus_is_hotpluggable was true at device_add time (I suppose
qdev_get_hotplug_handler was NULL at device_add time).

BTW, maybe we can get rid of qbus_is_hotpluggable by doing something
like this:

1) This code in device_set_realized:

        hotplug_ctrl = qdev_get_hotplug_handler(dev);
        if (hotplug_ctrl) {
            hotplug_handler_pre_plug(hotplug_ctrl, dev, &local_err);
            if (local_err != NULL) {
                goto fail;
            }
        }

can fail with an error (QERR_DEVICE_NO_HOTPLUG is already there) if
dev->hotplugged && !hotplug_ctrl.

2) In device_add, this code is now superfluous:

    if (qdev_hotplug && bus && !qbus_is_hotpluggable(bus)) {
        error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
        return NULL;
    }

3) in device_get_hotpluggable, the right side of the && can be replaced
with "qdev_get_hotplug_handler(dev) != NULL", getting rid of
qbus_is_hotpluggable.

Paolo
