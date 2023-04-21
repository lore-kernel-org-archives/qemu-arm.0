Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1121049ejm;
        Fri, 21 Apr 2023 05:49:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y1b2fRDA7E9nHaw3ZYmPtNErycVWAfqBAzM1Zvp4cuPS5QOpQjgKf0ysR5cVrWWJoFm2v1
X-Received: by 2002:ac8:5dc9:0:b0:3de:81b0:aab8 with SMTP id e9-20020ac85dc9000000b003de81b0aab8mr7077626qtx.52.1682081340339;
        Fri, 21 Apr 2023 05:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682081340; cv=none;
        d=google.com; s=arc-20160816;
        b=tDzj8tmGH01rdWIwYOZLuB0CL0eW+/Wy+UoRX0lx94ouqLjqks4PraVW3kQwrQMAvY
         FKwccAZx6jGYfjAepK2ADvMmdagauy5+e3mS3dGsRENLmn2xvd9jP/cL2c/dfdYbOPX0
         dJrViRfdtJzd7rlu/+hDCluTjZxdtefalT6a81rI7BToeFsAgSn2fVW0g4IGsFpeLuxO
         tTJXPXw5GE0SotS/Z8epwKahxaXx/QAR8SakDA7wQHFpBgLpDuyCtikF1iR7/3yfNoEv
         xI/0Jg7AfiZc2p8j8mduBUgPhfrlwbMJjG8TlzTQF1X6PxnY9GTi6CU51Vn2ABXF2Jpc
         EXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=1GBpUOSxRgKEt8uIkRmXEqNzI53ZxK/94N7NuG4RJMM=;
        b=yT0GVeslf2sccJknwikkAhLVMS/I/DvAfRZBIOfs+ib0NfITXcHX2H34HoYDghJZsk
         GMtcJ/1roZ6pczFUJdRPdfKTKQ3s55jmDalY67jgS38/SiY1kyRHS/s18xaKze0ZtP3A
         yx81SG0Ioa9Vs6KKzvgA3LiUuSQRIasl/Sflhqr3qUaegX/witQk3j7gl4dA6VAB6Nva
         WaMPrOI/FBv8v2sLJ5uZQ/DcdE7RfvrTXxOH9OCItUt390t829USVPeVy52pjGI+/wFp
         bPfwqw7s+BYIAzuI3kfiqlOAqRXDXOWEyOOaU1K0F8zxnMv0+tXwMjx8ClmhCpvvDfxz
         xwvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020ac85803000000b003de70d6dbd7si3281003qtg.80.2023.04.21.05.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 05:49:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppqBw-0001ad-AI; Fri, 21 Apr 2023 08:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ppqBv-0001aC-Eo
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 08:48:43 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ppqBt-0004oT-La
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 08:48:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 493D42016D;
 Fri, 21 Apr 2023 12:48:38 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 14:48:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002b49bc248-54ee-465a-999c-ec4c2d040d37,
 7111A4B1C16D83D618E44FD4B545295E183D9861) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2c2a359b-15eb-48c1-2a2c-edf34b83e9d6@kaod.org>
Date: Fri, 21 Apr 2023 14:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] tests/avocado: Make ssh_command_output_contains()
 globally available
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Cleber Rosa
 <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, <qemu-arm@nongnu.org>
References: <20230421110345.1294131-1-thuth@redhat.com>
 <20230421110345.1294131-2-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230421110345.1294131-2-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 58fd5c0b-8843-4a0f-9cba-52011bc8c984
X-Ovh-Tracer-Id: 9666413650748214124
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehthhhuthhhsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvg
 epshhmthhpohhuth
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e42eKykARZZ/

On 4/21/23 13:03, Thomas Huth wrote:
> This function will be useful in other tests, too, so move it to the
> core LinuxSSHMixIn class.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   tests/avocado/avocado_qemu/__init__.py | 8 ++++++++
>   tests/avocado/linux_ssh_mips_malta.py  | 8 --------
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index cb71f50db9..6788837e1b 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -431,6 +431,14 @@ def ssh_command(self, command):
>                            f'Guest command failed: {command}')
>           return stdout_lines, stderr_lines
>   
> +    def ssh_command_output_contains(self, cmd, exp):
> +        stdout, _ = self.ssh_command(cmd)
> +        for line in stdout:
> +            if exp in line:
> +                break
> +        else:
> +            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
> +
>   class LinuxDistro:
>       """Represents a Linux distribution
>   
> diff --git a/tests/avocado/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
> index 0179d8a6ca..d9bb525ad9 100644
> --- a/tests/avocado/linux_ssh_mips_malta.py
> +++ b/tests/avocado/linux_ssh_mips_malta.py
> @@ -101,14 +101,6 @@ def shutdown_via_ssh(self):
>           self.ssh_disconnect_vm()
>           wait_for_console_pattern(self, 'Power down', 'Oops')
>   
> -    def ssh_command_output_contains(self, cmd, exp):
> -        stdout, _ = self.ssh_command(cmd)
> -        for line in stdout:
> -            if exp in line:
> -                break
> -        else:
> -            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
> -
>       def run_common_commands(self, wordsize):
>           self.ssh_command_output_contains(
>               'cat /proc/cpuinfo',

