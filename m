Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C08FCC6B30
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:36:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHInY-0001ZG-2G; Thu, 15 Oct 2026 06:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xHIn4-00017X-2S
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:34:28 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xHIn0-0005To-PQ
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:34:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so46479505e9.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792060459; x=1792665259; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=nQyOr1Z5jySAz/1/kJJ++1Mttc/PZnyiAEeZmfuQdwQ=;
 b=i0stPFD8OLpi3vDkXtHZvMNAJ+3s/eLitRh0OXsYdeh7YsDGjrFpBtWQDSTIl829Ge
 U/qtclRwtVdiCkCeL6OWQ/KKZB59xXYlThhemqdU5TeEddT1I+V0j9WauCAzuoNS49pq
 cdj40L4cFXm0Eg44dhOqv4LNfNM9EBWmzSqyAtwmm54AxlmvJQZulO4GiP2ISgawY841
 EZrlrRtWYl5r6j8dV4swLm5QQhXeNYQKMj98CMB1y8M2Fp8F+AX1k75h/D9lzR8KCCKI
 q4cNvFea27+uOZzcZPyvncJI4Daaxd9y6V86UepWRCJsS4LJGgsAu2XeXMVav+/V9HRO
 P5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060459; x=1792665259;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nQyOr1Z5jySAz/1/kJJ++1Mttc/PZnyiAEeZmfuQdwQ=;
 b=d4Qzu8bGA7eLSWp6UOpDHRAzUf8wb7h5EaCQfdMmITM/GDo1x01B59kYTjdjMoQ8/k
 s/W4DRJP0gJ2BRqwFBeLI4b/VioABvVT82I6dvydc0vHYSXG7+jWr4BdXuFbhim7NxwN
 +ztpKmlIjPqezH6x+GKzBhQDEFB2gRx8R6LwTUVpFBetwE2tMD8k5l7HSmJBCYmrS4zX
 pijN0eX2ImiXTeTsU3WOAAloA1Dhv7AEIGd1BhyqNdKVmJkUkjAKHy10cMJOncVWYuWv
 1kkZ6Fd4s5oInjkL6A192pMx/c43yZda/S1elioS+AA1js4IOMGDqEJMm0o47YIKET/a
 /RnQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBye5VJVBFhOb+rluimVIAUgjHZMbBuL09QjY5U5/hnz7DluRoMv992po5SSuc/T5LPmenRz3M5mlQ==@nongnu.org
X-Gm-Message-State: AFq9FYLTlP/UCOo04CHIEZPD8+CQhEl9OiUhxgkQ+SCiBuImvLZIh8Kh
 QqbxcgdMGI6roKmSdKZThn/Yd7Fv0F8EZ26SMuaYmH02vXwdQaHZ/jNEgfC7ViEVbkQ=
X-Gm-Gg: AYBFou3RIjR7Ac/1XhVDJXWoZv7H8Y89oVPHu5WUfxXU/5hr9LBAZW9aFXeuRMOVWe8
 c9n0W7GgRzUCl6ayvfLmNpLGUQXztnHEAuYnb8dVDhQqh8P6fp1UeqFk6MC+RNziUDKQGQg2c5p
 wUmfNLRejDX8/LbxoiT8z77Vgy4KdeKHMtfM8dXToO9LL+X+kGU5bZDyxh6E1kRAupINvuLZjbB
 GHDIGO4CFqdb7ofcxkNI6EB2hVgENXP+l03/VyC/3g0lsqzg5yIlXPwHI6JtbJvGNGE+pPkZYJw
 o/2omscxxoIaqEdEDv0RSiDudJJO3eoVFAt2JPyOpzAhAiR4Ci6VEk2HSd8Jyr9aZEU6FUKXZ3X
 Etlk86eaL24z6ifJBA2BlkE61fxvwdbHQgw0EgQ5IfUuIuum0kqhEF4GaPUE+p5SE9BSD9VrNDk
 kV65HGSto49vaNjpoD4DMIyM/P5zuVlsndvgYGEabpbsp8L8VQVX7VKA4hatyjCRQaLOE4NA==
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id
 5b1f17b1804b1-4a18e498471mr397848315e9.20.1792060459135; 
 Thu, 15 Oct 2026 03:34:19 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48df3cbb78asm4405720f8f.48.2026.10.15.03.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:34:18 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1CC815F869;
 Thu, 15 Oct 2026 11:34:17 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,  Zhao Liu <zhao1.liu@intel.com>,  Kyle Evans
 <kevans@freebsd.org>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Brian
 Cain <brian.cain@oss.qualcomm.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Brad Smith <brad@comstyle.com>,  Ani
 Sinha <anisinha@redhat.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Thomas Huth <th.huth+qemu@posteo.eu>,  Keith
 Busch <kbusch@kernel.org>,  Matthew Rosato <mjrosato@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,  John Snow <jsnow@redhat.com>,  Eric
 Farman <farman@linux.ibm.com>,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Anders Roxell
 <anders.roxell@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Warner Losh <imp@bsdimp.com>,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Xu <peterx@redhat.com>,  Klaus Jensen <its@irrelevant.dk>,  Song
 Gao <gaosong@loongson.cn>,  qemu-s390x@nongnu.org,  Laurent Vivier
 <laurent@vivier.eu>
Subject: Re: [PATCH v2 16/16] tests/functional: add tuxrun kvm gdb test for
 s390x
In-Reply-To: <9898cc36-2438-473c-aed5-eb1a5671c2d0@linux.ibm.com> (Ilya
 Leoshkevich's message of "Tue, 13 Oct 2026 21:42:03 +0200")
References: <20261012170330.1144446-1-alex.bennee@linaro.org>
 <20261012170330.1144446-17-alex.bennee@linaro.org>
 <9898cc36-2438-473c-aed5-eb1a5671c2d0@linux.ibm.com>
User-Agent: mu4e 1.14.4-pre6; emacs 30.1
Date: Thu, 15 Oct 2026 11:34:17 +0100
Message-ID: <87ecdrfe1i.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Ilya Leoshkevich <iii@linux.ibm.com> writes:

> On 10/12/26 19:03, Alex Benn=C3=A9e wrote:
>> As with x86_64 we now have the bits to add a KVM gdb test. One minor
>> wrinkle is the s390x only supports WP_WRITE watch points so we skip
>> the other watch point tests lest we get confusing messages about
>> failing to insert HW breakpoints.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/functional/gdb-scripts/kernel_gdb_test.py | 10 ++++++----
>>   tests/functional/s390x/test_tuxrun.py           | 14 ++++++++++++++
>>   2 files changed, 20 insertions(+), 4 deletions(-)
>> diff --git a/tests/functional/gdb-scripts/kernel_gdb_test.py
>> b/tests/functional/gdb-scripts/kernel_gdb_test.py
>> index 2d62fe01f10..56f0514c943 100644
>> --- a/tests/functional/gdb-scripts/kernel_gdb_test.py
>> +++ b/tests/functional/gdb-scripts/kernel_gdb_test.py
>> @@ -107,11 +107,13 @@ def do_one_watch(sym, wtype, text):
>>   def check_watches(sym_name):
>>       "Watch a symbol for any access."
>>   -    # Should hit for any read
>> -    do_one_watch(sym_name, gdb.WP_ACCESS, "awatch")
>> +    # s390 only supports write watchpoints
>> +    if "s390" not in gdb.selected_frame().architecture().name():
>> +        # Should hit for any read
>> +        do_one_watch(sym_name, gdb.WP_ACCESS, "awatch")
>>   -    # Again should hit for reads
>> -    do_one_watch(sym_name, gdb.WP_READ, "rwatch")
>> +        # Again should hit for reads
>> +        do_one_watch(sym_name, gdb.WP_READ, "rwatch")
>>         # Finally when it is written
>>       do_one_watch(sym_name, gdb.WP_WRITE, "watch")
>> diff --git a/tests/functional/s390x/test_tuxrun.py b/tests/functional/s3=
90x/test_tuxrun.py
>> index 8e0261e2b7f..528af3c08ff 100755
>> --- a/tests/functional/s390x/test_tuxrun.py
>> +++ b/tests/functional/s390x/test_tuxrun.py
>> @@ -19,6 +19,9 @@ class TuxRunS390xTest(TuxRunBaselineTest):
>>       ASSET_S390X_KERNEL =3D Asset(
>>           'https://storage.tuxboot.com/kernels/6.18.54/s390/bzImage',
>>           '5efeb31754b211440e1595ab11355bb006fe78a2c0604ed0a8c55c4598b71=
aec')
>> +    ASSET_S390X_VMLINUX =3D Asset(
>> +        'https://storage.tuxboot.com/kernels/6.18.54/s390/vmlinux.xz',
>> +        '5bbd4d34e0950f88053a9bfd16078896df4b1ee1696fc2ad62488e681a6bdd=
8e')
>>       ASSET_S390X_ROOTFS =3D Asset(
>>           'https://storage.tuxboot.com/buildroot/20260924/s390/rootfs.ex=
t4.zst',
>>           '5ba18c4d18831c50a0c743990f7bdee1d3b520629d423c55b668d8fbbac9c=
6f5')
>> @@ -42,5 +45,16 @@ def test_s390_kvm(self):
>>                              haltmsg=3D"Requesting system halt",
>>                              accel=3D"kvm")
>>   +    def test_s390_kvm_gdb(self):
>> +        self.set_machine('s390-ccw-virtio')
>> +        self.require_accelerator('kvm')
>> +        self.wait_for_shutdown=3DFalse
>> +        self.common_tuxrun_gdb(kernel_asset=3Dself.ASSET_S390X_KERNEL,
>> +                               vmlinux_asset=3Dself.ASSET_S390X_VMLINUX,
>> +                               rootfs_asset=3Dself.ASSET_S390X_ROOTFS,
>> +                               drive=3D"virtio-blk-ccw",
>> +                               haltmsg=3D"Requesting system halt",
>> +                               accel=3D"kvm")
>> +
>>   if __name__ =3D=3D '__main__':
>>       TuxRunBaselineTest.main()
>
> This hangs unfortunately.
> You need something like the following to compensate for the difference
> between vmlinux ELF addresses and the actual nokaslr load address:

I realise now I had it working on my s390x image and forgot to fold the
changes from that tree into my local git. Fixed in v3

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

