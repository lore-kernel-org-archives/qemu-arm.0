Received: by 10.182.158.201 with SMTP id ww9csp1588024obb;
        Wed, 18 Nov 2015 13:35:52 -0800 (PST)
X-Received: by 10.31.153.143 with SMTP id b137mr1028477vke.157.1447882552165;
        Wed, 18 Nov 2015 13:35:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y69si1083279vky.106.2015.11.18.13.35.52
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Wed, 18 Nov 2015 13:35:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzAON-0000AX-QK
	for alex.bennee@linaro.org; Wed, 18 Nov 2015 16:35:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1ZzAOL-00006K-1t
	for qemu-arm@nongnu.org; Wed, 18 Nov 2015 16:35:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1ZzAOK-0002eL-70
	for qemu-arm@nongnu.org; Wed, 18 Nov 2015 16:35:48 -0500
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d]:33406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1ZzAOG-0002co-4R; Wed, 18 Nov 2015 16:35:44 -0500
Received: by qgea14 with SMTP id a14so38478919qge.0;
	Wed, 18 Nov 2015 13:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=+fpvhh+rQez/fA/BdpZLkUmShX1yZl3PTlzr27g/b7Q=;
	b=BJms5xegq0DYRo5K7DzU6KaCraq+ZO2HUnxra3q/9rgI9beCyOmZ4Fh6njuh8+A0wS
	fSYRhlMArrI+L72sAMoz5hwmbW2D1LYPulIVZTSmG+f41QkYeeyKXp38xxc8sMGe/MyK
	X3Wr9i2YnT3QGAgU6hR4Uj7evkxCFQHpnB75YzZMDrZ10edT1NGCiq8ObzdxBCaGE4O0
	M5dtv9LZ3rSNnyspux8wlZjqSU5HFXoi8+imNdDgMckSfcFEu8n6d4rAXXN97ZV2YQeZ
	gvtuHqzV9r16LuQzB6nec7xqaPkZ8zLjBpmAjKZkdPCH3n8TdyHMQUZvYm9jXO2SKDF2
	kxLQ==
X-Received: by 10.140.167.69 with SMTP id n66mr4023203qhn.41.1447882543466;
	Wed, 18 Nov 2015 13:35:43 -0800 (PST)
Received: from [164.54.92.32] (apsvisit32a.anlgh.org. [164.54.92.32])
	by smtp.gmail.com with ESMTPSA id
	v19sm1468686qhb.48.2015.11.18.13.35.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 13:35:43 -0800 (PST)
Message-ID: <564CEF2E.3080002@gmail.com>
Date: Wed, 18 Nov 2015 15:35:42 -0600
From: Michael Davidsaver <mdavidsaver@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Francois Baldassari <francois@pebble.com>
References: <1447796430-90226-1-git-send-email-francois@getpebble.com>
	<CAFEAcA-oUjbRbOPdReNTEmW5bSXX6j9X+tdNyqr-fpKk8TqK2w@mail.gmail.com>
	<CAHpaMEZVHNbjGx9sRqevBn8XGoyB=3tqWfMAqM-LXFMSBXwdvw@mail.gmail.com>
	<CAPokK=pn93wX9ePin_BQAtzYc43jJ0dYnNVVCRAYaifXst0cPw@mail.gmail.com>
	<CAHpaMEZPBp1xniXKQcJxqxA9STL0-5GQ+Y+ok1+=AUxEmJXu+Q@mail.gmail.com>
	<CAFEAcA--Ja0gfodVPgM_Ld+KVpWLijF6w7CBBD11VXd6QEHJVw@mail.gmail.com>
In-Reply-To: <CAFEAcA--Ja0gfodVPgM_Ld+KVpWLijF6w7CBBD11VXd6QEHJVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22d
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Priority masking with basepri on
 v7m
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
X-TUID: 4edKCCL+dCvT

On 11/18/2015 02:41 PM, Peter Maydell wrote:
> For a big patchset like this the easiest thing is to just ask
> Michael if he has a public git repo with the patches in (I've
> cc'd him).

https://github.com/mdavidsaver/qemu/tree/fixirq

The posted patches were

https://github.com/qemu/qemu/compare/c4a7bf54e588ff2de9fba0898b686156251b2063...dd7fc89e3c70b1e0074efa41e3ca89f5cee43054

This branch also has more recent changesets which weren't posted.  Some
of this will be posted in future (MPU stuff), and some should just be
ignored (qtest fumbling).

