Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1378786njl;
        Thu, 3 Oct 2024 04:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOpj+L3VupLPQfnOBLNI+5DAGVmL8QBGe94hrmMVuDvr1Snb5/1ZrB7zYMRouIt3VRdPn+DPGbMRFUvg==@linaro.org
X-Google-Smtp-Source: AGHT+IEFp5NyjPs83Hzjs3eYhRA/Cv+1sPqsBmVKa3WxUaRBWPFU0JNoLoci6HHakyzN5JmoPrxy
X-Received: by 2002:a05:622a:1313:b0:458:2756:fdb with SMTP id d75a77b69052e-45d804e561dmr97442731cf.29.1727956116482;
        Thu, 03 Oct 2024 04:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727956116; cv=none;
        d=google.com; s=arc-20240605;
        b=PPYbGTXp0ueEaGzhK1kkU32LSbtoSxVJWhft8+sVyDpVr9MgjXkLxLn60X7zp74K5W
         tqp67/julAFD9losbftz6pOtLitcRDLdcxRlPmOjNLN5iE4G01+wJLVJqu04WYp3hI7X
         ytr/R3rbf8gPfoIK+cJXsyeUAbAKYRvQblQ1A8Lgcek5KUiwqnvPr2BZTS21Ws2lLWP4
         7VHdhHw8BcePu/tPXr3limNXnq3JwpKa5+KJ3TGEkVBJFlnSw2um7qdGmDlzfU+AfwWe
         GZHhcHmc97vCZhiO4R3wrxjbuqcZRYcPo1ERZDUd3OgQTYdymMs6c4frlhPLsrV5ExFi
         YTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=a1acHY6fh6+wqHRLFAYFWoikOwNPLODXkcHHMjYb79k=;
        fh=H+stBQWG4a3Z3CKRYfoKDtokZ5UxVdyDRhDpJ21L9xI=;
        b=LOrcHnh60xR1HieYr5DGZ/mem8ynnbgpYyvhKNPFVzE9DhgnSIylMybJyJQ9Sn88Lt
         4UyZwkaTkivG/ydMRsxp9si0DfK0HX+ioxJQty9TfRto1s98UVGS3Pretr9CpmAYqvX0
         nGLuTfzJ1VUBsdHge8ixxTvYCCpJ0zk0jCcCFJDxQ+rXbMpxj6DPZpp+zW6hy9B8qI9C
         gy4cGZ+lSCwNsSSCOaXm4jK9BJheeNmGEzfCRgvWlZAAXkFktoVxZZhxTy8joE3xHmgy
         fjOSsANMH+PV4KdMZtqfsnZQQJNQDFCFmygfN64OmB0T7BzAFpplcYzC6u4vgkDnVYRs
         XviA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gT/A5q1T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45d9539650dsi6789891cf.241.2024.10.03.04.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 04:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gT/A5q1T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swKJa-0006UL-9Z; Thu, 03 Oct 2024 07:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1swKJW-0006TB-PD
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 07:48:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1swKJU-0006NL-Pr
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 07:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727956085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1acHY6fh6+wqHRLFAYFWoikOwNPLODXkcHHMjYb79k=;
 b=gT/A5q1TgUt6Q6n5TzvxQTRMuaqqkyCtI5w5FYoZeUrtE6eSoHE3QphxwxCdEo/MZ+wEIa
 0v8qJAPxnZS3YIK09ziW8BU3nvebIXSkYjzhQrWC2uT541/iPqWrY2V2FOXNvFg6s+Muek
 LIaoJAB7cnFNi1mfHW9DBpI4Z9reOW4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-GJ4Url-fONSYwuZEACgH8w-1; Thu, 03 Oct 2024 07:48:04 -0400
X-MC-Unique: GJ4Url-fONSYwuZEACgH8w-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5398dde92f4so711804e87.3
 for <qemu-arm@nongnu.org>; Thu, 03 Oct 2024 04:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727956083; x=1728560883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a1acHY6fh6+wqHRLFAYFWoikOwNPLODXkcHHMjYb79k=;
 b=h1S47JaJ7gxPytg9cLlK4K+LGYUPul+0QeEkGF9P6SjhEqY9S43GNvttI5Sp1Vdvc/
 vSzP+F1lgFaGAYUpvccJk+BA6Yg2uhjlFmUJpjk9GJitH6U9MHKKezCnYUaKxh69Hnba
 e5QVOt4o6l1QTo+lD1NE27s6X3OiTvjaHhdGpWoeomJx3uyH8A54q1GeGwF0XvyZK1WJ
 /7Ftpu2yA19u1zKdbMu8gfJTA+bmmFp3j5Wv7QDeJuwI8rAz2FZwPIPmyO7fI/5nXWFA
 faEIkiLQ3R5toOyPNFE3zisc5K/vp7FxGTzldgp2fhyLn56Y9fdM7NMn6UciQYMusvFl
 NAXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkissLdxCoK+NXI9m71yWo9JaFkTE8cth9LKaYqSPCe7kvsnaQsYv5ZPFWRtLGSc1I0k5P15YeNA==@nongnu.org
X-Gm-Message-State: AOJu0YywSZCA9vJtLTpMOUsfkfXWB15NelsInvyd7pSremctUEFQIoMl
 SiwMJ/S7EjORuSjEiDzqAMB6GJqbo0ErzaZm+exyljYzC3QKZCL06k+B7BdZTgGqpnpBhApF3eB
 nnUs9xvvMuThhx1dXy/zzrn/MqQfzYOfVvKzdAoMwZv3fz53m3w==
X-Received: by 2002:a05:6512:350f:b0:539:a2e0:4e75 with SMTP id
 2adb3069b0e04-539a2e0508fmr2226743e87.14.1727956082987; 
 Thu, 03 Oct 2024 04:48:02 -0700 (PDT)
X-Received: by 2002:a05:6512:350f:b0:539:a2e0:4e75 with SMTP id
 2adb3069b0e04-539a2e0508fmr2226735e87.14.1727956082495; 
 Thu, 03 Oct 2024 04:48:02 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f8025b414sm13701945e9.15.2024.10.03.04.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 04:48:01 -0700 (PDT)
Date: Thu, 3 Oct 2024 13:48:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v9 01/12] acpi/ghes: add a firmware file with HEST address
Message-ID: <20241003134800.72aff741@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241001105426.48598baa@sal.lan>
References: <cover.1724556967.git.mchehab+huawei@kernel.org>
 <34dd38395f29f57a19aef299bafdff9442830ed3.1724556967.git.mchehab+huawei@kernel.org>
 <20240911155108.190f0fdf@imammedo.users.ipa.redhat.com>
 <20240913074435.0eea2552@foz.lan>
 <20240913152518.2f80ab1e@imammedo.users.ipa.redhat.com>
 <20240914073314.46368ff6@foz.lan>
 <20240916130506.293ab543@imammedo.users.ipa.redhat.com>
 <20241001105426.48598baa@sal.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: NMzVc93J+EzM

On Tue, 1 Oct 2024 10:54:26 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Mon, 16 Sep 2024 13:05:06 +0200
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > > But no idea how to start a machine using a saved state.    
> > 
> > see https://www.linux-kvm.org/page/Migration
> > 'savevm/loadvm to an external state file (using pseudo-migration)' section
> >   
> 
> It didn't work. Is migration currently working between 9.1 and 9.2?
> 
> I did a compilation of qemu version v9.1.0-rc0 and saved the state.
but it's better to use actually released 9.1 source code.
that should be effectively virt-9.1 machine type
(unless something changed between rc0 and release version)

show us CLI on source side (i.e. qemu instance where you saved state,
it should be the same as below modulo '-incoming' option)

> 
> Then, on vanilla 9.2 (changeset 01dc65a3bc26), I tried to restore the
> state with both "virt" and "virt-9.1". None worked:
> 
> 
> $ qemu-system-aarch64 -m 4g,maxmem=8G,slots=8 -M type=virt-9.1,nvdimm=on,gic-version=3,ras=on -cpu max -smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 --nographic -monitor telnet:127.0.0.1:1234,server,nowait -incoming "exec: gzip -c -d statefile.gz" -no-reboot -bios /new_devel/edac/emulator/QEMU_EFI-silent.fd -kernel /new_devel/edac/work/arm64_build/arch/arm64/boot/Image.gz -device pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device virtio-net-pci,netdev=mynet,id=bob -drive if=none,file=/new_devel/edac/emulator/debian.qcow2,format=qcow2,id=hd -object memory-backend-ram,size=4G,id=mem0 -netdev type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp tcp:localhost:4445,server=on,wait=off -append 'earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4'
> qemu-system-aarch64: error while loading state for instance 0x0 of device 'cpu'
> qemu-system-aarch64: load of migration failed: Operation not permitted

and that should've worked

 
> $ qemu-system-aarch64 -m 4g,maxmem=8G,slots=8 -M type=virt,nvdimm=on,gic-version=3,ras=on -cpu max -smp 4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 --nographic -monitor telnet:127.0.0.1:1234,server,nowait -incoming "exec: gzip -c -d statefile.gz" -no-reboot -bios /new_devel/edac/emulator/QEMU_EFI-silent.fd -kernel /new_devel/edac/work/arm64_build/arch/arm64/boot/Image.gz -device pcie-root-port,id=root_port1 -device virtio-blk-pci,drive=hd -device virtio-net-pci,netdev=mynet,id=bob -drive if=none,file=/new_devel/edac/emulator/debian.qcow2,format=qcow2,id=hd -object memory-backend-ram,size=4G,id=mem0 -netdev type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp tcp:localhost:4445,server=on,wait=off -append 'earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4'
> qemu-system-aarch64: Machine type received is 'virt-9.1' and local is 'virt-9.2'
> qemu-system-aarch64: load of migration failed: Invalid argument

that isn't meant to work.

> 
> Did I made something wrong?

let's see src CLI first, and then ask someone who knows more about migration and how to troubleshoot it

> Regards,
> Mauro
> 

