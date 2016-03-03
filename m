Received: by 10.25.208.211 with SMTP id h202csp2792911lfg;
        Thu, 3 Mar 2016 08:46:39 -0800 (PST)
X-Received: by 10.55.19.170 with SMTP id 42mr4289928qkt.21.1457023599722;
        Thu, 03 Mar 2016 08:46:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t90si41717884qgd.103.2016.03.03.08.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 08:46:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:36190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abWOd-0000VR-8j
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 11:46:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1abWOa-0000Uz-UY
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 11:46:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1abWOV-00051h-VQ
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 11:46:36 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33165)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1abWOV-00051G-OD; Thu, 03 Mar 2016 11:46:31 -0500
Received: by mail-wm0-x241.google.com with SMTP id n186so5068008wmn.0;
	Thu, 03 Mar 2016 08:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=DhdJODkTgJxN6qqrFKMdep9Kt2wY1ay5fDFHRBhkdZc=;
	b=umLEB/2rE1clZtZHK53C//ISzVUaI+sHey5fr6VNX9sVVzF7gHRX2ujT4Kd4SHDaM7
	pKIsUEbhkY0vfVQJty07OaFl1Qhcaa2tJFu2jmVRcDDOqs0jjbNQ/ySgL48v0Ge9Rw0X
	198XDz8Ybzjfjw3wOcF8xkJyAb5PFcRW2QetlsrRaV91Kbhhj7ZBRQscDAMR7AYC1zQ4
	2rTrI9IUA/+wAtx+61MCEB1k01G9xOQU9iru4HdIVbq/uVLQFifVUhcta/KrE/pAXQwM
	+QfBwK5/ICFFummo0ozKk1nok7yxH9nPt3qynjvv5h4dgqc9x6YzqZ/H+IIS97F1ewSs
	9eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=DhdJODkTgJxN6qqrFKMdep9Kt2wY1ay5fDFHRBhkdZc=;
	b=Jbh+X9H2fFHOK8QbjHFACl/sdD3CfVEclLWrRtVfqD2Z1s807G+fgX6sCVdMT+LiWL
	G2i4fSSkWTl4amarXfhTQlKztVbi0QvtuUz5ZJaaG2v/JF22ZG0IWtcvCoUTRR8pRZt3
	XOa1xUdhveyU+8g6pONEFKgV8qS7KX8cGzdP/KA+YKDSiEqITmcwZV5PK9Gdc4mSVoUd
	bqtCXAHUV0JtUriAOj5gLv9LWx/e7ssh09UZC0ioZf/b4BI0NdHqcaPjVNdoor3dRyex
	BtsomL+5FEMjt+gxZXhq7YaHmteBERYPyeGSzwbz3y9dd4syoQOTBvitQHd43vVLzrGA
	fcQg==
X-Gm-Message-State: AD7BkJIOg7xl6g0K1eYDWpnidRlyCk88IXjTflAYHtbWCsCt6wEZPHZakaB7TgmJWvRtjQ==
X-Received: by 10.194.63.75 with SMTP id e11mr3975260wjs.79.1457023590704;
	Thu, 03 Mar 2016 08:46:30 -0800 (PST)
Received: from [192.168.10.150] (94-39-138-146.adsl-ull.clienti.tiscali.it.
	[94.39.138.146]) by smtp.googlemail.com with ESMTPSA id
	d9sm41427584wjf.43.2016.03.03.08.46.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2016 08:46:29 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<1455288361-30117-3-git-send-email-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56D86A64.1040909@redhat.com>
Date: Thu, 3 Mar 2016 17:46:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1455288361-30117-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 2/4] loader: Add load_image_mr() to load ROM
 image to a MemoryRegion
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
X-TUID: MQ3w5kmRyqZm



On 12/02/2016 15:45, Peter Maydell wrote:
> Add a new function load_image_mr(), which behaves like
> load_image_targphys() except that it loads the ROM image to
> a specified MemoryRegion rather than to a specified physical
> address. This is useful when a ROM blob needs to be loaded
> to a particular flash or ROM device but the address of that
> device in the machine's address space is not known. (For
> instance, ROMs in devices, or ROMs which might exist in
> a different address space to the system address space.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

The patch looks good, in particular it should be fine for the non-fw_cfg
uses of rom->mr.

The fw_cfg interface to loader.c indeed should be turned upside-down so
that the knowledge moves outside rom_add_file (to a rom_add_fwcfg
function for example) and rom_add_file doesn't need to call rom_set_mr.
 Your patch is at least a step in the right direction, because it adds
memory region support in the !fw_cfg case.

So,

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks,

Paolo
