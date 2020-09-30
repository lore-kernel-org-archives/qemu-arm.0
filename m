Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5518624lfq;
        Wed, 30 Sep 2020 06:24:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLsh9C9o4nUZLiavBPjv0jluRD6UXwq8a4cg+7I1VY+iNG6i6bH9jzD6p/zcTX+JZJUJWO
X-Received: by 2002:a25:2687:: with SMTP id m129mr3188987ybm.425.1601472286398;
        Wed, 30 Sep 2020 06:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601472286; cv=none;
        d=google.com; s=arc-20160816;
        b=x37A5NPl9BKWz8JhMnpH4sJwYDW6BKOMjslSiIW8ZfN+AuhWwBWvSGsb35BpJWJ1H6
         DbU/pM4BmlOzaCNIvvXKFk6cPq6KVNzdfGhaPZ4St6IjiHclSzlDU9gZGx9dEx3pDyhS
         GHDIeHGGzeDOFcIZWTmphoBn7N4Agny/5ID8PTuQJLgFrU6vJBRcwM7C5S4Y7KDqUZYE
         JTA6Co26gLfA+33WkpMTp4RqQHAnlTZQpBRXRQA6xJyzwo7G29K7TgXBMQYDcbVYO5HI
         EInpKo+zjYVQl3E43zFcjWlvhbM1IsG5c2bB3DZePidGkA9URoaAKgWNl2kr59LHxlRg
         wfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=stVcbDfdLQzTa80M5DmjetElKyIutbnN14+FcKZcDXM=;
        b=HsiOCrI1i+OGsj7prbZdJBfOXVtBYZV8O4kVq1nqTgZa/Efb9qoJeyarU3eDjohQv5
         X+zTRn7GmrOzGU7HL9CIiU5AR2KqCo8WnRU8a+YNl8hX7FqecXDUA/cbgKbGCm3aiSln
         OwXuBGDm2pKQHgVo6arF0SCkTk0BctRIvpslY+xO2xseX8Nt6itCZuqs34OiF22DLSxU
         mluhfBJ8gL1sfeBXFjyLvJolMm0twuIvJMVnkn0KykAkQxmunMFsZFV0YAtW+u6dKnm0
         8ETnsh8nmDzIHlc868WMKnxgLKxqHH4TFSy8GlaLmXtb39wHqZjZSLjRxK3FAG3onoPn
         e1Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ctv1MmCK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si1638737yba.136.2020.09.30.06.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 06:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ctv1MmCK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNc69-0007Tu-Ps
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 09:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kNc61-0007TB-3r
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 09:24:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kNc5x-00042a-02
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 09:24:36 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601472271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=stVcbDfdLQzTa80M5DmjetElKyIutbnN14+FcKZcDXM=;
 b=ctv1MmCKucIa9Sy1voeLD1TIFQBSAt2ywYwGvCdwzpsUwfQ/t/ywKLP9DS6UMXXT/axmHA
 X64z5seUM58FYIoPJOSk1BYZcfXRIosCOCJ1+JOAJsfQCHLiogZ6kzAaLsy4VgRCkgQZEO
 oZj/zCkLi5WXpkYCgYMcHxI7tCNNkbA=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-lGeV7PkoPV-V3gO6_OjTkw-1; Wed, 30 Sep 2020 09:24:29 -0400
X-MC-Unique: lGeV7PkoPV-V3gO6_OjTkw-1
Received: by mail-vs1-f70.google.com with SMTP id u12so168550vsh.18
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2020 06:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=stVcbDfdLQzTa80M5DmjetElKyIutbnN14+FcKZcDXM=;
 b=bG47EuZVt5rtDO9XNG4RonsBcPKZddA3agOTTGKVNaaZdSCdnLtmzqIkgjOXh0mAf2
 FfTHYA8Lnm4L0fIFaEOFOMRqkcmrAs1BelJbgWRM6rA03MqySH0XOEo93R1Z3h1JwqPf
 7X33MJ9cokxHv/5zUUFfasNBriHLH8Er6kQ0xkaFiIkPZGzYecwGch6zBQ0rsjCCB4DJ
 zFOFCXKbdXZxf2lZDfpmJ9+V53Y7C4b7B2I372EoJTEQis/cbGMGoQIeuY1fX5j9i7ZS
 xZtD8YD0i53FLW1QXjb3x6Uznr+uYouKfr7wxjOw90X07hvPQkA1Ln/iyvJdxezpaBjz
 gqnA==
X-Gm-Message-State: AOAM530a9AvPWMZmDxIx8BRv/PuMgmaAbIR+7MZS/9hAIp0AM4ocUP/R
 rP280eY+9cATPYpMrBaReeuBU1W2UUHV6ijHy4VYS2iLxQ5FxMXpg8eicuwF0Za/izk2RSgnPeQ
 rfzJUlzfVHUQu53PxJPT/vPrOCKdO
X-Received: by 2002:a1f:acc9:: with SMTP id v192mr1299965vke.19.1601472267921; 
 Wed, 30 Sep 2020 06:24:27 -0700 (PDT)
X-Received: by 2002:a1f:acc9:: with SMTP id v192mr1299944vke.19.1601472267679; 
 Wed, 30 Sep 2020 06:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200929224857.1225107-1-philmd@redhat.com>
In-Reply-To: <20200929224857.1225107-1-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Sep 2020 10:24:16 -0300
Message-ID: <CAKJDGDZeBxjjkGt2o6SjKSMc9avT0YUWAXkBnt7zqtW0xopkAQ@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d16HD0lXYE/A

On Tue, Sep 29, 2020 at 7:49 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The current 'virt_kvm' test is restricted to GICv2, but can also
> work with a GICv3. Duplicate it but add a GICv3 test which can be
> tested on some hardware.

Fair enough! :)

>
> Noticed while running:
>
>  $ avocado --show=3Dapp run -t machine:virt tests/acceptance/
>  ...
>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: ERR=
OR: Unexpected empty reply from server (1.82 s)
>
> The job.log content is:
>
>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-ker=
nel GICv2 emulation\n'
>
> With this patch:
>
>  $ avocado --show=3Dapp run -t device:gicv3 tests/acceptance/
>  (1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv=
3: PASS (55.10 s)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/acceptance/boot_linux.py | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux=
.py
> index 0055dc7cee..c743e231f4 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -182,10 +182,11 @@ def test_virt_tcg(self):
>          self.add_common_args()
>          self.launch_and_wait()
>
> -    def test_virt_kvm(self):
> +    def test_virt_kvm_gicv2(self):
>          """
>          :avocado: tags=3Daccel:kvm
>          :avocado: tags=3Dcpu:host
> +        :avocado: tags=3Ddevice:gicv2
>          """
>          if not kvm_available(self.arch, self.qemu_bin):
>              self.cancel(KVM_NOT_AVAILABLE)
> @@ -195,6 +196,20 @@ def test_virt_kvm(self):
>          self.add_common_args()
>          self.launch_and_wait()
>
> +    def test_virt_kvm_gicv3(self):
> +        """
> +        :avocado: tags=3Daccel:kvm
> +        :avocado: tags=3Dcpu:host
> +        :avocado: tags=3Ddevice:gicv3
> +        """
> +        if not kvm_available(self.arch, self.qemu_bin):
> +            self.cancel(KVM_NOT_AVAILABLE)
> +        self.vm.add_args("-accel", "kvm")
> +        self.vm.add_args("-cpu", "host")
> +        self.vm.add_args("-machine", "virt,gic-version=3D3")
> +        self.add_common_args()
> +        self.launch_and_wait()
> +
>
>  class BootLinuxPPC64(BootLinux):
>      """
> --
> 2.26.2
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

