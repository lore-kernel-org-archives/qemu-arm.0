Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5143404lfg;
        Tue, 2 Mar 2021 23:43:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+WhPhX/UJelD5yjvEsql68A8l6WE07wJsEjHDS9ikwNz+wfWwgZ1BGweG/rKl3P4FQmVo
X-Received: by 2002:a05:6e02:d4e:: with SMTP id h14mr20810762ilj.80.1614757433368;
        Tue, 02 Mar 2021 23:43:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614757433; cv=none;
        d=google.com; s=arc-20160816;
        b=qAlUAYqeVx/BctmpBiGoUABtpRRxGuvW3YQQUa6poYM2Ws1Yp8n/v074JeBsvsZ6xu
         b3wjQ5ZyGbo3ifOd9K44HoC9o3t1+TxW0/NBODQUOJiufZjhC/IcfbwIeWA3ebOMr02V
         UPehI2ZeeXTbjg7OPppSCo27as+T3r58yjF7R7FzE6+rQeQez0hwJSGdl3JFLmNYcyf2
         NTVSTG0fSboU/38Kd9r+48wtNO24AYVtT1K2Zyidsmbrz3cvAQt9DfjRCRlT7DDewXKz
         U8kO2NTJVO22VaWFIg3CCcRJlM09Y2aX5wVoQ5e00CIAYbaeokX9j8QrXoaQQHyN4Tqs
         CMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ibQrBgpvJycTCHOKFN1uaOkdl8toFI7em5jmy/OYvMU=;
        b=Wes/eB2OfDn9Ce4cIL0o4dc6ssAQ1qZJZehH9rqxk8/lF6HZFGivTuwWu4NChy8A0R
         UdMcbNIvRRuJ3gMYJ5XvYgRitzX0+utVfIVXIwIgnLlgIhQRC1QETw5ugx+0lTpD2FSN
         e6Ra85aZcEu7e/n13LUyOgBlwE488ugVudT0ksAwSmiDFt4PqHj6OD2g/ln5z6e9o0nV
         YeY+Ajp4cpNvEPtF9Vt8EageHhWStPH/oEyTQvrIV9aJpXyiITCRaf5+W4MLgTs+7f7f
         dxzlyoTZOmFVGxvXPrZYpuidO/sEbtQNLNc+DVwInvrJ8MIIJ1/pT7cZSKHIxYz0ge92
         /GZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si20825356ilb.68.2021.03.02.23.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 23:43:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHMAi-0007O0-No
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 02:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lHMAa-0007Ne-ND; Wed, 03 Mar 2021 02:43:44 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:54217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lHMAY-0003aM-21; Wed, 03 Mar 2021 02:43:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 20ABC8C81075;
 Wed,  3 Mar 2021 08:43:37 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Mar 2021
 08:43:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00607c5ebc4-632e-43b8-aee2-e58fbf912014,
 24CAEE7A76C7E725A9866EAA9907F8E378F99BC5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/2] tests/acceptance: Test ast2600 machine
To: Joel Stanley <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>
References: <20210303012217.637737-1-joel@jms.id.au>
 <20210303012217.637737-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bacc0fb1-1030-c3a3-6b59-079b858698bd@kaod.org>
Date: Wed, 3 Mar 2021 08:43:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210303012217.637737-3-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 198366f3-9368-44df-94e9-f48306d979b7
X-Ovh-Tracer-Id: 4479111307813817196
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtuddguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffheelffejkeegleeviedufedtlefffeeivdfgjedufeektdffffffhfduueeftdenucffohhmrghinhepuggvsghirghnrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nqf/DDAGiqHS

On 3/3/21 2:22 AM, Joel Stanley wrote:
> This tests a Debian multi-soc arm32 Linux kernel on the AST2600 based
> Tacoma BMC machine.
> 
> There is no root file system so the test terminates when boot reaches
> the stage where it attempts and fails to mount something.

because of that, the test always fails  :

console: [    3.615193] No filesystem could mount root, tried:
console: [    3.615269]
console: [    3.615688] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
FAIL: Failure message found in console: Kernel panic - not syncing (22.45 s)
RESULTS    : PASS 0 | ERROR 0 | FAIL 1 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0


Is there a way around this problem ? 

C. 

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tests/acceptance/boot_linux_console.py | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 2f46a08fdc10..6b7d7f5df984 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -1094,6 +1094,32 @@ def do_test_arm_aspeed(self, image):
>          # self.wait_for_console_pattern("login:")
>          self.vm.shutdown()
>  
> +    def test_arm_ast2600_debian(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:tacoma-bmc
> +        """
> +        deb_url = ('http://snapshot.debian.org/archive/debian/'
> +                   '20210302T203551Z/'
> +                   'pool/main/l/linux/'
> +                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
> +        deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
> +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
> +                                    algorithm='sha256')
> +        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
> +        dtb_path = self.extract_from_deb(deb_path,
> +                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path)
> +        self.vm.launch()
> +        self.wait_for_console_pattern("Booting Linux on physical CPU 0xf00")
> +        self.wait_for_console_pattern("SMP: Total of 2 processors activated")
> +        self.wait_for_console_pattern("ftgmac100 1e670000.ftgmac eth0: irq")
> +        self.wait_for_console_pattern("VFS: Cannot open root device")
> +        self.vm.shutdown()
> +
>      def test_m68k_mcf5208evb(self):
>          """
>          :avocado: tags=arch:m68k
> 

