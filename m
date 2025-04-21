Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp1793901njd;
        Mon, 21 Apr 2025 08:12:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFc3ZakCGhItu+VDemNt66u/C2WARSDG65w9zScOV3M/Ew0cuGh2ZvgHtVPRhsfnUjn++WAmssTiJprQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFYUQrVsNXzQmnKe2hDR/WtE7l1JvKEVCPzO9hyuL/OxYPc3vGeGc0o/DqukvrNRWBJc5KG
X-Received: by 2002:a05:622a:a953:10b0:47b:4d3:5d12 with SMTP id d75a77b69052e-47b04d35f97mr95523701cf.49.1745248379791;
        Mon, 21 Apr 2025 08:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745248379; cv=none;
        d=google.com; s=arc-20240605;
        b=f3Axq0dOHCgnNNCgF4h6cBO+UASSn+Nj1/+d0CguvA6gAc1QE0UZMTINaRomTMXkrS
         v3+E7twqweBWDYlz6XeqCK0i5fhgJo8kt9EODi5eQMR1ulRKqkFcRwiwM7vxZ9ReEml3
         ZHNeHFY5WzQt2iC7dOz8pk36F0IC00Ia2A9o42+1ehNwlUkQQYXzv0RIpMoOtyQy8mVd
         52Mbn/w48OKxMhuGT3sWaXUY3ryaXjQvZcobV94F9BhqoYU597+qkY4+Y1EaScLEUAFb
         Kg5Mlaio3cxg8j/wp+ZWw8SknLtHEeMUTl9i0EOALBsDiNef0ikdeNLvTuvD6li6R/mJ
         JjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6YN5HqmBZi839J5JH4cbHdkLsmc/cLs6rgwsN33UkJk=;
        fh=YNiIN7ENoBi0HsYlXFb/eFj133cEDV25wfQW4hoApks=;
        b=dlg/6d2569gKqjuLIzZHgcT2UEKQtDruL6veUUHthJyxdJ5+auwEcahnGDbCXQbsEY
         f3B0KIAuWwsluEOTw2hwvJE0+J5hMDj5yO5w9ePs31qOj0+z7m3OuXYwK3ioF/L5Jxca
         Iw/Ub1nZYHzkDwvZ7Uvo1T48g2qZmz3mXXc5ycjItsXhw0lUqPS1cNN1Kjpyalwju4eE
         QWI2N/VesWOm03xeo/sUUXktpvn9IFnDy59gU9fsXXc5HEsz0TtZoJIHEi+pQidEYm4j
         MH+GODWTmOjedHbx3oInoc+gVNWh1d+eh8e0l0pEmSZlfjuFA0oMXxsknVonXWFfl/Aj
         nTiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JfsjGi25;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9cf20f2si91836811cf.670.2025.04.21.08.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Apr 2025 08:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JfsjGi25;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u6sp5-0002vd-C8; Mon, 21 Apr 2025 11:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u6sp4-0002vG-0d
 for qemu-arm@nongnu.org; Mon, 21 Apr 2025 11:12:38 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u6sp1-000293-Sk
 for qemu-arm@nongnu.org; Mon, 21 Apr 2025 11:12:37 -0400
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-47681dba807so885791cf.1
 for <qemu-arm@nongnu.org>; Mon, 21 Apr 2025 08:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745248354; x=1745853154; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6YN5HqmBZi839J5JH4cbHdkLsmc/cLs6rgwsN33UkJk=;
 b=JfsjGi25lYaMc1ZtmtPqW3WWYvNdBiqCLNowl3e8XFEWdbaiW0HEIm+ZHint0vht3C
 waY3PKYosTGq68qZPnK9jKHtwJrtWA5c5DQ++eOMPUpvFek/YpZ1Z67ECgWp5NBAid4Z
 EFea7SzLczSoGQFhY2Bx5L+7DnNM2zxOEPORhL4XfoMilTGIeaP2Kyrd7setU6fbJzGs
 G2A30qNbS/n4hNbIdvlQzGHxFXSJ0rRD+jsVdOC+Wyh+i7Yh0aBB3qnNRKQZs1kh6KuY
 fTbsVF5/mqbBGNwAHi8J6U5GEw9l4Cf4yKf+9vhRkucBAof8XsunhXl4nVDT0MvYt408
 g/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745248354; x=1745853154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YN5HqmBZi839J5JH4cbHdkLsmc/cLs6rgwsN33UkJk=;
 b=uxnnxeIJZ6JX0Ys2WpH/BOkEa23Fhqx+guwV/SeN+E2UxnWW+WkKpTdHkI537FysNo
 65XmOTzQtjC8nyB74h5Z5Ro6FBjK4oSLqnIi9cV6a/S0x5A6DOPhOOx/2HG+0O5iGK/H
 xyPPBXD3jmRblwfCQ0reZhGOGbkyofjMnNf0bt/AhF3al2+rWmizJhoodoVEFDtZ+8P0
 nbcqeQFQdq7b5W69nHGbr0T4JB6p3+RtSHOMzACU3lAwX72fBnxrHsDhqhI1Ulom2nyb
 Iij798MkWjMm+cYUrrvDZqLfzg4jdGKdPaWQODi2mfuPodP8OZmmpKRbW67HGzOcqZcs
 k+8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCBERB6VAin2H/G/oSuBU10ym8L8CJrJgR9C12OnX+vh+NjUvRX6/VOXnOW/Q3HtY305R5LWB2pg==@nongnu.org
X-Gm-Message-State: AOJu0YzIN5uu+JbXjdIDyqo2q1yyf1o5iOWe5mI2rsUu0C9lrnupzwcO
 h80jFNeZ0RiY+YZgMvciF17ndSGgAAJNbexGjofBHVqTm4A9YshozuinKN6itk9bcUQMpui/N8k
 4q0jB+06/Dhr+QNMy6E3Fv1aXNiCzwanGwCkl
X-Gm-Gg: ASbGnct3/UEVIDUPTZxOt98s8F3Z3LC+lotEd4xTp5DMKhZJZUnV2/nEb/lCnc3vwvJ
 5JuU0K0+bq7R1I0Ik9iqqKggEqkM6pfoNJ79pwcerW6L3Kj1bsS6DfVrTNKCXVp8TYV+ACaG/Hf
 eLgYOlUKhFReTHAewMuxQUHexejFbdWi9MwI4x1l3vET0IAtpd+K3S
X-Received: by 2002:ac8:5e13:0:b0:477:1f57:5493 with SMTP id
 d75a77b69052e-47aeb26fa62mr11514771cf.20.1745248353772; Mon, 21 Apr 2025
 08:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
 <20250417031209.2647703-8-jamin_lin@aspeedtech.com>
In-Reply-To: <20250417031209.2647703-8-jamin_lin@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 21 Apr 2025 08:12:22 -0700
X-Gm-Features: ATxdqUE38HtO0ZJ680opJUNXzC-WpYrFrPjkQarJYLManNnrnRJioIdHtJWFkzU
Message-ID: <CA+QoejU-EJiyP_nXMpP=n8=5z36fAZRDapb9kB4zt_kaCi8_-A@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] tests/functional/aspeed: Move I2C test into
 shared helper for AST2700 reuse
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -180
X-Spam_score: -18.1
X-Spam_bar: ------------------
X-Spam_report: (-18.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 9p9Zv3mXtj36

On Wed, Apr 16, 2025 at 8:12=E2=80=AFPM Jamin Lin <jamin_lin@aspeedtech.com=
> wrote:
>
> Move the I2C test case into a common helper function (do_ast2700_i2c_test=
) so it
> can be reused across multiple AST2700-based test cases. This reduces dupl=
ication
> and improves maintainability.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
> ---
>  tests/functional/test_aarch64_aspeed.py | 28 +++++++++++++------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/t=
est_aarch64_aspeed.py
> index c25c966278..441f7f3919 100755
> --- a/tests/functional/test_aarch64_aspeed.py
> +++ b/tests/functional/test_aarch64_aspeed.py
> @@ -18,6 +18,8 @@ class AST2x00MachineSDK(QemuSystemTest):
>      def do_test_aarch64_aspeed_sdk_start(self, image):
>          self.require_netdev('user')
>          self.vm.set_console()
> +        self.vm.add_args('-device',
> +                         'tmp105,bus=3Daspeed.i2c.bus.1,address=3D0x4d,i=
d=3Dtmp-test')
>          self.vm.add_args('-drive', 'file=3D' + image + ',if=3Dmtd,format=
=3Draw',
>                           '-net', 'nic', '-net', 'user', '-snapshot')
>
> @@ -35,6 +37,17 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
>              'https://github.com/AspeedTech-BMC/openbmc/releases/download=
/v09.05/ast2700-default-obmc.tar.gz',
>              'c1f4496aec06743c812a6e9a1a18d032f34d62f3ddb6956e924fef62aa2=
046a5')
>
> +    def do_ast2700_i2c_test(self):
> +        exec_command_and_wait_for_pattern(self,
> +            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device=
 ',
> +            'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
> +        exec_command_and_wait_for_pattern(self,
> +            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', =
'0')
> +        self.vm.cmd('qom-set', path=3D'/machine/peripheral/tmp-test',
> +                    property=3D'temperature', value=3D18000)
> +        exec_command_and_wait_for_pattern(self,
> +            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', =
'18000')
> +
>      def start_ast2700_test(self, name):
>          num_cpu =3D 4
>          uboot_size =3D os.path.getsize(self.scratch_file(name,
> @@ -73,8 +86,6 @@ def start_ast2700_test(self, name):
>                               f'loader,addr=3D0x430000000,cpu-num=3D{i}')
>
>          self.vm.add_args('-smp', str(num_cpu))
> -        self.vm.add_args('-device',
> -                         'tmp105,bus=3Daspeed.i2c.bus.1,address=3D0x4d,i=
d=3Dtmp-test')
>          self.do_test_aarch64_aspeed_sdk_start(
>              self.scratch_file(name, 'image-bmc'))
>
> @@ -83,28 +94,19 @@ def start_ast2700_test(self, name):
>          exec_command_and_wait_for_pattern(self, 'root', 'Password:')
>          exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}=
:~#')
>
> -        exec_command_and_wait_for_pattern(self,
> -            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device=
 ',
> -            'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
> -        exec_command_and_wait_for_pattern(self,
> -            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', =
'0')
> -        self.vm.cmd('qom-set', path=3D'/machine/peripheral/tmp-test',
> -                    property=3D'temperature', value=3D18000)
> -        exec_command_and_wait_for_pattern(self,
> -            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', =
'18000')
> -
>      def test_aarch64_ast2700_evb_sdk_v09_05(self):
>          self.set_machine('ast2700-evb')
>
>          self.archive_extract(self.ASSET_SDK_V905_AST2700)
>          self.start_ast2700_test('ast2700-a0-default')
> +        self.do_ast2700_i2c_test()
>
>      def test_aarch64_ast2700a1_evb_sdk_v09_05(self):
>          self.set_machine('ast2700a1-evb')
>
>          self.archive_extract(self.ASSET_SDK_V905_AST2700A1)
>          self.start_ast2700_test('ast2700-default')
> -
> +        self.do_ast2700_i2c_test()
>
>  if __name__ =3D=3D '__main__':
>      QemuSystemTest.main()
> --
> 2.43.0
>
