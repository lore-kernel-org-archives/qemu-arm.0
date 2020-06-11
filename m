Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1338143lfc;
        Thu, 11 Jun 2020 04:14:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTgRuKy5SEEFyXUfA/OlAyg3XHQBapYgtshW1QSVGtKD/yQVamN2848vwCYaa+umYVzbwF
X-Received: by 2002:a05:6902:52b:: with SMTP id y11mr13085894ybs.465.1591874049687;
        Thu, 11 Jun 2020 04:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591874049; cv=none;
        d=google.com; s=arc-20160816;
        b=1Iy0QkFYHeELkwvTH1GmgK5Po0B1e/5V4Qvy0L+XXlQcngjOdhbYJSp1AXozEXNoHi
         eIocjefWFs8oQw1Nn6Z0qHJkB+LQ90z45Mk1adgURhpGsEIavJ+EXwQL4MBJnvj/J2sV
         3dnvn0M/ljGx/cNSr/R9kQu2sd9meMDlLeQr74I9DkgwTVhW7GzXQW734LLrNG5YE/JZ
         sTLqUg9gQaZd4t1/+vPtYl1D8eSmTBbL8fr3iwQqXoO2NUS1gixefEKCcNsZjEizB1C2
         FBSxp7g40nfZRx+t0Ja3tK3ziZ/HTz2DynHmwjYocQ1dSOQu7UdbnNZ8cILcZst5kfxO
         KQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=ZkiIg1uFn+dMQhhmS7GB9r4W5JJIeV6//+14vUA/9b4=;
        b=Oedhbr0GUcG+nbgfDgy3DeBVnCkXWIO9GNq3j5liHwHcayIqffcrFx3ThMWx44LpDh
         rCblwBej02HkekFJsN9BfBdWLmc/kl+/t9ZTOe97xVNkthymKJUOPEA6EZI5jBeXiKbs
         ZDts0qs00Sc0fMmQRFftmlNmNa5lVrVk/rL6PQtcH5CJBtSFsP8q08JZGXNfVBnK0Rpa
         4WPgsm5UXCbUqjRVr6TrvlpMBrwdELGp+9/lJICeELu633zP4keVeX76U3RZEulID4N+
         oT/+g7vWwo8SwlBvmk4HfoYcB+9dHmRGLH5MnWmrPdvl9udmWqtIjv2yDkOHd9Ehqi9A
         a3qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iGiTL+rR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w65si2439736ybg.452.2020.06.11.04.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 04:14:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iGiTL+rR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjL9t-0007bE-2G
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 07:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1jjIra-00011g-CM
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 04:47:06 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:43567)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1jjIrZ-0003Sk-3U
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 04:47:05 -0400
Received: by mail-io1-xd42.google.com with SMTP id u13so5404748iol.10
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ZkiIg1uFn+dMQhhmS7GB9r4W5JJIeV6//+14vUA/9b4=;
 b=iGiTL+rR7Sl6frPvOrbhP2xLWX+0exRIQUIsk/HPZNpitYCdFNhejyvo4OjhiT3ebc
 vzZpiilteLzai+KOIIEY3XPz6AZJTBbKpXS9D+Oq/e5xZgIT0sQsehTJyNgmEfF62tHp
 Ek6OX6dnN4kNS2Ww9oNX5Zz0x8ZbNTB4ijCSz9zKLbuPH0GU20TYJsv99nLBhzBZSuZy
 LXkrMMr9Alrq/OxJ9NhMkkw5+7mK9BOZrNM65OBWBt7t3pyI83YNuJmTjz24SRFBatSK
 meMTFPk9gOAYnding7+doQ3IF7wkkvk11sGPOzO6LgOWWQaxUUA0i5UBNhkdcyXdVGEP
 m77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ZkiIg1uFn+dMQhhmS7GB9r4W5JJIeV6//+14vUA/9b4=;
 b=ZdfmP73L0xhXx2BfF9QNc6WYukOa1ivgtltfFLeBJKrryGUG0B1LWXFyNaA8vJ+7tQ
 bFgi07m9HHNDLY3aRTTukku1femL6vzTIzGO3M5OUQbBIS5giMIMSoFxRxtyDYoe4DMf
 jKSDSEWjZ7kZipCG92+nS6vSfZOofQWTBbRRkbbciAO384otvfsivCENZIbKGbQBXB64
 fitIzJqVHAp1qOCd4R3Pv/mSiJRjEA0hQxHyEw5Kb+Vcl3jGho3BVH14E1NV0WGqbxZs
 YiXRUAsWd9JM1aOpMhnsv+L66Xe6v3d51GVFnFL/EVhxNF0Lv0Nkci00bheQxD2Gm5+q
 tvQw==
X-Gm-Message-State: AOAM530/QkcdACquaKnbDkkGYYq4n0sODWyHPi6gMJVJ0OWoxfaEIW3H
 XOYUMJRRqdjY1UaK5Qn34s08VdsRyhSi/tNndY0I
X-Received: by 2002:a02:810:: with SMTP id 16mr2252230jac.17.1591865216918;
 Thu, 11 Jun 2020 01:46:56 -0700 (PDT)
MIME-Version: 1.0
From: Haibo Xu <haibo.xu@linaro.org>
Date: Thu, 11 Jun 2020 16:46:45 +0800
Message-ID: <CAJc+Z1Eb815hroFPY+9Ai_9hh=+eje+X2ENtGj9XA+_F0XUPqg@mail.gmail.com>
Subject: Core dump happened when starting a VM on arm64 server
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Jun 2020 07:14:01 -0400
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
Cc: drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 44DZ2Y4ORHsT

Hi,

I met a qemu core dump issue when starting a VM with cpu feature
"pmu=on" on an arm server.
The commands to start the machine is:

  ./qemu-system-aarch64 \
           -cpu host,pmu=on -M virt,accel=kvm,gic-version=3 -nographic
-m 2048M \
           -kernel ./Image \
           -initrd /boot/initrd.img-5.6.0-rc2+ \
           -append "root=/dev/vda rw console=ttyAMA0" -nodefaults -serial stdio\
           -drive if=none,file=./xenial.rootfs.ext4,id=hd0,format=raw \
           -device virtio-blk-device,drive=hd0


And here is the stack dump:

 Core was generated by `./qemu-system-aarch64 -cpu host,pmu=on -M
virt,accel=kvm,gic-version=3 -nograph'.
 Program terminated with signal SIGSEGV, Segmentation fault.
 #0  kvm_ioctl (s=0x0, type=type@entry=44547) at
/root/Downloads/qemu-git/accel/kvm/kvm-all.c:2509
 2509        ret = ioctl(s->fd, type, arg);
 [Current thread is 1 (Thread 0xffffa5108010 (LWP 22057))]
 (gdb) bt
 #0  0x0000aaaadc432950 in kvm_ioctl (s=0x0, type=type@entry=44547) at
/root/Downloads/qemu-git/accel/kvm/kvm-all.c:2509
 #1  0x0000aaaadc432adc in kvm_check_extension (s=<optimized out>,
extension=extension@entry=126) at
/root/Downloads/qemu-git/accel/kvm/kvm-all.c:866
 #2  0x0000aaaadc541ff0 in kvm_arm_pmu_supported (cpu=<optimized out>)
at /root/Downloads/qemu-git/target/arm/kvm.c:212
 #3  0x0000aaaadc53a08c in arm_set_pmu (obj=<optimized out>,
value=<optimized out>, errp=0xfffff2fba6b0) at
/root/Downloads/qemu-git/target/arm/cpu.c:1113
 #4  0x0000aaaadc88facc in property_set_bool (obj=0xaaab0b61a0f0,
v=<optimized out>, name=<optimized out>, opaque=0xaaab0b627690,
errp=0xfffff2fba6b0)
     at /root/Downloads/qemu-git/qom/object.c:2162
 #5  0x0000aaaadc892af4 in object_property_parse
(obj=obj@entry=0xaaab0b61a0f0, string=<optimized out>,
name=0xaaab0b527d00 "pmu", errp=errp@entry=0xfffff2fba6b0)
     at /root/Downloads/qemu-git/qom/object.c:1552
 #6  0x0000aaaadc892bbc in object_apply_global_props
(obj=0xaaab0b61a0f0, props=0xaaab0b473a60, errp=0xaaaadd003930
<error_fatal>)
     at /root/Downloads/qemu-git/qom/object.c:410
 #7  0x0000aaaadc891a64 in object_post_init_with_type
(ti=0xaaab0b20e9f0, obj=0xaaab0b61a0f0) at
/root/Downloads/qemu-git/qom/object.c:383
 #8  0x0000aaaadc891a64 in object_initialize_with_type
(data=data@entry=0xaaab0b61a0f0, size=<optimized out>,
type=type@entry=0xaaab0b212a40)
     at /root/Downloads/qemu-git/qom/object.c:517
 #9  0x0000aaaadc891ba4 in object_new_with_type (type=0xaaab0b212a40)
at /root/Downloads/qemu-git/qom/object.c:681
 #10 0x0000aaaadc4bfd10 in machvirt_init (machine=0xaaaadd003930
<error_fatal>) at /root/Downloads/qemu-git/hw/arm/virt.c:1804
 #11 0x0000aaaadc69ec5c in machine_run_board_init
(machine=0xaaab0b47e950) at
/root/Downloads/qemu-git/hw/core/machine.c:1132
 #12 0x0000aaaadc51f50c in qemu_init (argc=<optimized out>,
argv=<optimized out>, envp=<optimized out>) at
/root/Downloads/qemu-git/softmmu/vl.c:4347
 #13 0x0000aaaadc3d2abc in main (argc=<optimized out>, argv=<optimized
out>, envp=<optimized out>) at
/root/Downloads/qemu-git/softmmu/main.c:48
 (gdb)


The root cause is in the arm_get_pmu() operation which was introduced
in ae502508f83.
After deleting the KVM feature probe operation in this function, the
issue can be fixed.

 diff --git a/target/arm/cpu.c b/target/arm/cpu.c
 index 3801e25b79..ff18db8fd4 100644
 --- a/target/arm/cpu.c
 +++ b/target/arm/cpu.c
 @@ -1110,10 +1110,6 @@ static void arm_set_pmu(Object *obj, bool
value, Error **errp)
      ARMCPU *cpu = ARM_CPU(obj);

      if (value) {
 -        if (kvm_enabled() && !kvm_arm_pmu_supported(CPU(cpu))) {
 -            error_setg(errp, "'pmu' feature not supported by KVM on
this host");
 -            return;
 -        }
          set_feature(&cpu->env, ARM_FEATURE_PMU);
      } else {
          unset_feature(&cpu->env, ARM_FEATURE_PMU);


According to the Qemu document(docs/system/arm/cpu-features.rst), the
pmu is turned on by default when using KVM mode on a V8 host machine,
which means the pmu=on is redundant when starting a VM with PMU support.

  target/arm/kvm64.c
  672     /*
  673      * We can assume any KVM supporting CPU is at least a v8
  674      * with VFPv4+Neon; this in turn implies most of the other
  675      * feature bits.
  676      */
  677     features |= 1ULL << ARM_FEATURE_V8;
  678     features |= 1ULL << ARM_FEATURE_NEON;
  679     features |= 1ULL << ARM_FEATURE_AARCH64;
  680     features |= 1ULL << ARM_FEATURE_PMU;
  681     features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;

But I think we need a better way to handle this when "pmu=on" is
present in the command line, not just trigger a core dump(qemu binary
was built from the current master branch).
Any comments?

Regards,
Haibo
