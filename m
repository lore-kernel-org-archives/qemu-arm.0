Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1435836lfg;
        Fri, 20 Aug 2021 09:03:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmIEZeulqRpj872tN8HoghmekTo3egfq7bEx8QqBSEpvFD55mKKu7PJ4f9cBphl5CPYBtp
X-Received: by 2002:a05:600c:4105:: with SMTP id j5mr4810817wmi.86.1629475429279;
        Fri, 20 Aug 2021 09:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629475429; cv=none;
        d=google.com; s=arc-20160816;
        b=ACuWgeCaCkq2CbXTC1WShYiZd60Y73keqMgm0yfRA0vKbHgPWZcdrYO/xH6eGEBje+
         qFd5ZDG9G5BYYjhADr/j56Y52rfPPY/YIMHcQAJWYekzLY8aV6k0cmftkJTmPRjb42r/
         4MRPJBKR0oERUhVKGRYxbLeSklWPEEpbNck7nATRdrphsXm53GpKQ9cEExHOJ1FzlbnG
         +mq3pypbGLOP9RvXoTfnL5ENSWtc2T8T72X/5sOPDP+r/ymaFve8WJ71ZyZSKtt+LjW3
         kOf7ttPwo2nSBLKGU7zQa4dD8LLEa/SBI86lYJtgaowesdzR5QVTdMZRUuYbmfkbMozF
         xUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=XHe66gXNq+ap9l8IJOAoHstXF/Hcfk422KpynzkNAx8=;
        b=DjhduGXXJa0p5d532N+/uGKZ+adg9JXC7PccYqcFpvrpKC7qFbpxnpLLEuul+onmHC
         aO+++8Ru/O61u/IbqAI0kBGsyckebuJZU1+nj74p3UCs4XyxODwACqEIfX5RmFuvg2xc
         6qDXf0L20zFuph+w3daRZThtS1QQz0vC0+W2EqStqX5mqalc6RP3eSGbFvWxSLRbUqVr
         iYpXkUE45iDind0o3a8cZDH19KZzX40Od6O2jd1eXAKxmbCcG3JNVcYzFEOHkMgpfaJ9
         WC8gBF8RGpAJwSHZViZVvGvRsmz0C1GV0R5NghF/A+dfH/hoB9YhmsKUY6ry+GJgVt2D
         yFNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D3FFodJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16si1223680wmt.186.2021.08.20.09.03.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 09:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D3FFodJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH6zk-0002E3-8y
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 12:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH6zS-0001pB-RY
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 12:03:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH6zQ-00088k-JC
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 12:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629475407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHe66gXNq+ap9l8IJOAoHstXF/Hcfk422KpynzkNAx8=;
 b=D3FFodJXgkQ2XTuxxqF02BnUCeOxnN71RynHM7WIy5g5q/CuWAjorX4JuS604qLY32OPk0
 ZmRDS2OytsUj4A8aRP3FqHZyL5NVXitEoi5s9ARJ4355elxhWi8t+mAssNCnHyc2cBs9eY
 7NAAYgmGYWd/VoFlSQ17y99YFQFlW5s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-WlBGnBWmPV6lN5G4rcBlpA-1; Fri, 20 Aug 2021 12:03:26 -0400
X-MC-Unique: WlBGnBWmPV6lN5G4rcBlpA-1
Received: by mail-ed1-f69.google.com with SMTP id
 x24-20020aa7dad8000000b003bed477317eso4795117eds.18
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 09:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rv/NoGLl01sXJCJTv2lBx8ZMh6/K4n2hKUQtbvN/xss=;
 b=rfEHPqLv+AQPW0t80F1Gm5IX+rNSP+MdbLLHHe6vFebLO3yxA1NjvwovrZNh+X7L1k
 Cd69ZEebFhyiZ+u2GsEQ3Dp/5NDSpCj7C2AipZVQ0vp51aodx7bpD5hS43MWYSD1r94R
 ETKVl/GC38IAkxd1xYEsS8gMhXMhSlsG3DZ0Kf8Yz0Bo8qNRoo0fRMjeC3LmYiw9gwVn
 i/w/t7FIlpEAv3U1AgZ6zMMBAgP8xnCrw9WR1+tuDHdUHYewrOJ7mJSBsz5RdrJbd+ZD
 xclC3hMU3hqwuCdXEMlIalfrNTXke/2DsbHf0j1X5EAWs4fGETPLbVcGGrMPpwWYHyc6
 2rTA==
X-Gm-Message-State: AOAM5321/0chOM2TlQqbdfY6mY5x8qtGkic0/ngoeOXl2Qtz8jxkHVJ7
 Tnti+zNGpYWNJqX5Kr6qZcPtB44Cn+zjLiZOflpQbJ89SF4LESSkPsGHsvffNA5sPqTKEPvbzSQ
 SyJhb2B3ivj/l
X-Received: by 2002:aa7:d787:: with SMTP id s7mr23256399edq.336.1629475405238; 
 Fri, 20 Aug 2021 09:03:25 -0700 (PDT)
X-Received: by 2002:aa7:d787:: with SMTP id s7mr23256358edq.336.1629475404951; 
 Fri, 20 Aug 2021 09:03:24 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id b10sm3787780edd.33.2021.08.20.09.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 09:03:24 -0700 (PDT)
Date: Fri, 20 Aug 2021 18:03:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
Message-ID: <20210820180323.7df8751d@redhat.com>
In-Reply-To: <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
 <20210820174402.47a14625@redhat.com>
 <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "Richard W.M.
 Jones" <rjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dGBDru4a/rrr

On Fri, 20 Aug 2021 17:47:01 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 20.08.21 17:44, Igor Mammedov wrote:
> > On Fri, 20 Aug 2021 15:39:27 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >  =20
> >> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> wro=
te: =20
> >>>
> >>> On 20.08.21 16:22, Bin Meng wrote: =20
> >>>> Hi Philippe,
> >>>>
> >>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daud=C3=A9
> >>>> <philmd@redhat.com> wrote: =20
> >>>>>
> >>>>> Hi Bin,
> >>>>>
> >>>>> On 8/20/21 4:04 PM, Bin Meng wrote: =20
> >>>>>> Hi,
> >>>>>>
> >>>>>> The following command used to work on QEMU 4.2.0, but is now broke=
n
> >>>>>> with QEMU head.
> >>>>>>
> >>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> >>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -devi=
ce
> >>>>>> loader,file=3Du-boot-dtb.bin,addr=3D0x4000000,cpu-num=3D0
> >>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
> >>>>>> allocate memory =20
> >> =20
> >>> -m 40000000
> >>>
> >>> corresponds to 38 TB if I am not wrong. Is that really what you want?=
 =20
> >>
> >> Probably not, because the zynq board's init function does:
> >>
> >>      if (machine->ram_size > 2 * GiB) {
> >>          error_report("RAM size more than 2 GiB is not supported");
> >>          exit(EXIT_FAILURE);
> >>      }
> >>
> >> It seems a bit daft that we allocate the memory before we do
> >> the size check. This didn't use to be this way around...
> >>
> >> Anyway, I think the cause of this change is commit c9800965c1be6c39
> >> from Igor. We used to silently cap the RAM size to 2GB; now we
> >> complain. Or at least we would complain if we hadn't already
> >> tried to allocate the memory and fallen over... =20
> >=20
> > That's because RAM (as host resource) is now separated
> > from device model (machine limits) and is allocated as
> > part of memory backend initialization (in this case
> > 'create_default_memdev') before machine_run_board_init()
> > is run.
> >=20
> > Maybe we can consolidate max limit checks in
> > create_default_memdev() by adding MachineClass::max_ram_size
> > but that can work only in default usecase (only '-m' is used). =20
>=20
> We do have a workaround for s390x already: mc->fixup_ram_size
>=20
> That should be called before the memory backend is created and seems to=
=20
> do just what we want, no?

it's there for compat sake only if I recall correctly,
there should be no fixups ever.
If user asks for nonsence, QEMU should error out and force
user to correct CLI (fixups were one of items that were in
the way of splitting guest RAM into backend/frontend model)

=20

