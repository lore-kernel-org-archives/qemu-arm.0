Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6320829lfg;
        Thu, 4 Mar 2021 07:13:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwy0GuipVjUjGbPZ5BfejiSbbHJ+bCXZujVY/IB29vhy9Zi3l8VnkXqMCI3Smf4E8bTrkp+
X-Received: by 2002:a02:1ac5:: with SMTP id 188mr4533586jai.71.1614870837825;
        Thu, 04 Mar 2021 07:13:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614870837; cv=none;
        d=google.com; s=arc-20160816;
        b=hWYSJfjtUdorPH4qKDsdAD7yhOl/67Ee7ynmXdhibCuUEcm7RF+m7qwsbVDZTNlF52
         7Vs9Pwl3gyRVlWyNULnTSGVADMO9AxlnMKwAzb7imY/qw48JRSvpDEb9RJTJGQWueL60
         1gYu1J5Uln+M7uJ9+hTAvHCpPKQ94E0e5+PvKi4/pAWgHclhZMoJQteO5xGrycmDkhmB
         t6Bq5PzECg6a3aiXHDG3SgQKnzBheH+qBSAdb/dBD8JII2YXJ7E2Ft0FNgzh9OsE1v8s
         cvbMt7I8HqbtdOAX3jPyhKzhiepav12rct4RSINTE2eNmCNpNWH+Wlv/kR7Zl7AP1aI5
         DxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=suLEeVv/Ks91n/hXhmr4Jce81cnVMhe1AIJnnS9unpE=;
        b=DFjbK/N/67kp+5hJnhrnWR3zwEsPyfJ4OYJ6/hhsy4IfnbzqjdyoQPl6vkx0Lx9+yb
         xoB2HrEt0kohsfolPxeC2GdjhsXtj3tuwktoce+EIMi+8bixS/2RggQKShQq5PqhxW+t
         KMG0KMMyUd7VSsxk3EIvx/i2gYoiy/E/bUxPsggDq+UsBOCh5KzkG5nfVItvSeFhW8UJ
         f5U95G3S3Mp+3RM3GPFB23sMkIZFOwH9cEX/ctuHM7NqO1Vod0eXPpUWQrLYvQO+VKDC
         EvJ+pC7ZzZlB5Tp8dadvZ63dpzAlo8FskZ0Oms7xQEUZFwfFYutuTE6D/l89BB6bYbWb
         6/1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si9233210jat.35.2021.03.04.07.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 07:13:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHpfp-0006T6-3L
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 10:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lHpar-0005xs-IG
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 10:08:49 -0500
Received: from 4.mo51.mail-out.ovh.net ([188.165.42.229]:58128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lHpap-0007u8-Ee
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 10:08:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 121B5267AD2;
 Thu,  4 Mar 2021 16:08:33 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 4 Mar 2021
 16:08:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001660c3978-5b56-4c97-bfb2-624837788f5d,
 861F461AB2AA5C3E7706B0F94E1142FCD934DD5A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.91.229
Subject: Re: [PATCH v2 2/2] tests/acceptance: Test ast2600 machine
To: Joel Stanley <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>
References: <20210304123951.163411-1-joel@jms.id.au>
 <20210304123951.163411-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <70780675-45ed-f68f-4220-39147d2d69ef@kaod.org>
Date: Thu, 4 Mar 2021 16:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210304123951.163411-3-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 72339887-924f-440a-b714-c41f6b6ddf4b
X-Ovh-Tracer-Id: 17866061197691947884
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtgedgieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhgffgueevtdejffeikeelfedtteduieehueeiiefhgfevteevffejkefgfefhnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: m5UJ+P92FgHv

On 3/4/21 1:39 PM, Joel Stanley wrote:
> This tests a Debian multi-soc arm32 Linux kernel on the AST2600 based
> Tacoma BMC machine.
> 
> There is no root file system so the test terminates when boot reaches
> the stage where it attempts and fails to mount something.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>

> ---
> v2: Update expected strings so test passes
> ---
>  tests/acceptance/boot_linux_console.py | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 2f46a08fdc10..4f1df69bc75c 100644
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
> +                         '-dtb', dtb_path,
> +                         '-net', 'nic')
> +        self.vm.launch()
> +        self.wait_for_console_pattern("Booting Linux on physical CPU 0xf00")
> +        self.wait_for_console_pattern("SMP: Total of 2 processors activated")
> +        self.wait_for_console_pattern("No filesystem could mount root")
> +        self.vm.shutdown()
> +
>      def test_m68k_mcf5208evb(self):
>          """
>          :avocado: tags=arch:m68k
> 

