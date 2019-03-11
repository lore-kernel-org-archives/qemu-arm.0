Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp990091wrt;
        Mon, 11 Mar 2019 12:14:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMeg2MteCUpgDtQahiQjXk8+RYHNTaiIJLWYM9vk6sF9Qt8J0T9kZ8syyCKW3e3VyDZb21
X-Received: by 2002:a81:5488:: with SMTP id i130mr2715883ywb.417.1552331694351;
        Mon, 11 Mar 2019 12:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552331694; cv=none;
        d=google.com; s=arc-20160816;
        b=DcEMEzuK/YmKB72jQyPpPM/tMj+H73SYFYDSTFmGk4LE15V4KZM9V7xLyh+Z/0y722
         TDcu5iiOA+MtsMTpnP2uXZRRXGcLkMCY3IaFS5coEOKCC3UDUlXgEkDiUwEGbvdifsyc
         xvRevfbjyysMbpdbxYHBVaSo5EqRgHDTepf/lNJno0eglocDvgKaY/Fg9KpU0aheZWa/
         UlbOMEonzMky2aHJh1As6wf/0cdMAYbMdQQ0ljKz19X0d9e+rjsa4/xcbSlNARfZQ+28
         PwfDfcVmg9QbVGtKZfrOQNb+3ybGTtxn1hWcdmpihovM88hyOsAmoFG0/S4PB6wbHLCG
         yJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=t/Ju3RGjOB/VCC2T4eWTkUtE40kgf1kx1bxFudii8Ew=;
        b=JI4YVHL1BcgEu/5nVIqToiFL70VhVAgqJiUsFOY5YzOmrltg/GVGftjAaz/4BxB+YO
         nrsnIiRmmk8GK73UWBz/xw3vg9z7lFmYc8LPg5No8NXGdNyDsE2bsC5wh2hcjSWgJbnM
         ClTD+3Kr6NIrvQqAFgrPxXVf93ngI6zuBp6Pxr/RVLCKmp94MOwDGmQnwTmAKJo6MC0Q
         skobQnzaOSWrT/LFKgIBxZP+NhG5MxY+mZIdi5bKpGQS3qYXfTPIuXnrV0wWD3dxGsDN
         X8fKrkK4XYUa3LYMNIeAUV2rlyDZOA2hWTmFQo7gEuV8271spnJLY2DwFxxB7pmXzH7l
         6E7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21si3644901ywc.327.2019.03.11.12.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 12:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3QNx-0007lr-PC
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 15:14:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL1-0005Js-Tx
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 15:11:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h3QL1-0003S5-5x
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 15:11:51 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:45687)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h3QKz-0003PF-EW; Mon, 11 Mar 2019 15:11:49 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1McpW8-1gTXHg42J0-00ZxL0; Mon, 11 Mar 2019 20:11:35 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Mon, 11 Mar 2019 20:11:23 +0100
Message-Id: <20190311191128.30562-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uiggGIFE87+5Ro86d2bMo0VnUBp95H9mK+y59bi/ruNY/bG2eWF
	smvx/WpiH3TKo7c2eC+LCkIhKP45PQKHZtziai0Wa1eKnY0Ahb0BG7lGEbOOF6B9nDROjU/
	Y/yRObodqZyCHw+CAm98a2qgmGTVgEYvwnuoM4v1Vmdtu6/iBYMbWWpavchK2xvRXUuqRxw
	4iIgIHV1rEse2lhSn1qlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jXYyqVadXbE=:3W5fVw1FVWyKosngBRcka8
	yLveP20m8YprKPH6slqrsXbFW/9Gs8xUGJzfCXesmAmuxhi2UZHJfBCJh8Mh6laNxd0TYdgZY
	7GTcVnsV7+iof0XGC76maq70KslVm3iXqxAYNFRUDuPJEqxLrc2D6p+LjuHlC+V/AxeZgmO17
	7x1Nj0LWKn8cfYUaDQtzfeFDE5ySgENc0qxKr5JJFLCMMZogFg92SbObdkSyMqgtLahjFvZ4P
	bQVSYJ5sIE5RkbsyAc2pBucFuxGUmbQwQpGiGkV+DBOzbMFYB6oZmLo4VWMnjU+k3JWb9liay
	DdfZ2uMFy2MGDv54k9WgkNfggBN737yuc0yQTjbYmh82BLpvc0/mzNiEd8bys5+kfK/OZUm9R
	NyplwUXyhBi97g7m9joiSwKN55Gi1vjAMHzmkD1JXEw0wG5baS8iTDfF93FPzkbg4PA3B6sh0
	Q2Vh3S+UzN1VjvtEa5JiO5J3lnp3HBjjmm5JaQLunCnr4tcokfAs82+OfqT7VSN/O41FL+Pad
	JyOP58/FzoIdfrB5T1eJpy1IEpLyJho6OeSXruxrlOqUQUkKYvz0UAJf0SXndJJxt4p3Mlf1N
	1h2Lwi87eeo69xxnwtkgBb3rfyTCWCLeTD6NIlKnqF/wPZPiA+XLW4OBgF25PrtvSFSUBJn5Z
	AiYe0B6Ghimq7YX9dOYUlcSB7gSTaC6niWu3Sf/QfDk6d+SyIyU8nU3h62gaCO3DVcLnOVy29
	gA1mOFziZCXSa1EaX4XUIXd0zzCLjwp8e7ROjbXYcleq2OG0FFh1Dm3kePk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-arm] [PULL 0/5] Trivial branch patches
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aYgSQOGn5grk

The following changes since commit 208d92df447bde0f1f810fae8a2c523cdeb7a28f:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20190311' into staging (2019-03-11 16:27:14 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 3b777a79c1cfa40f39f96220bc733eccd7392c9c:

  hw/nvram/fw_cfg: Use the ldst API (2019-03-11 18:48:20 +0100)

----------------------------------------------------------------
fw_cfg and thunk code clean up

----------------------------------------------------------------

Aarushi Mehta (1):
  thunk: improve readability of allocation loop

Philippe Mathieu-Daudé (4):
  hw/nvram/fw_cfg: Remove the unnecessary boot_splash_filedata_size
  hw/i386: Remove unused include
  hw/arm/virt: Remove null-check in virt_build_smbios()
  hw/nvram/fw_cfg: Use the ldst API

 hw/acpi/piix4.c         | 1 -
 hw/arm/virt.c           | 4 ----
 hw/nvram/fw_cfg.c       | 9 ++++-----
 include/sysemu/sysemu.h | 1 -
 thunk.c                 | 2 +-
 vl.c                    | 1 -
 6 files changed, 5 insertions(+), 13 deletions(-)

-- 
2.20.1

