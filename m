Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp3324376lfp;
        Thu, 21 Jul 2022 06:49:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vaW3vXIuBQsMqRc6y5v8zS9THDlDz5eafiBAVQUZ4Mlo9kB1tWB+f24WztXbvQXWA5O8JO
X-Received: by 2002:ad4:5ba3:0:b0:473:1b5:e8ba with SMTP id 3-20020ad45ba3000000b0047301b5e8bamr34018018qvq.49.1658411372173;
        Thu, 21 Jul 2022 06:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658411372; cv=none;
        d=google.com; s=arc-20160816;
        b=FMHcF0AaEFD7fJI4mF/drlRR/2UCMw9nqkApO4dgjucQ2bwP/6bbmpBH/ly2UfxWYS
         DJavrgaTKpDVkQu7kHWy3kaK6NaUtt1c9x42dtXJWs/BKNWK5C1HpJJBCtwbYAy7/NTh
         CpA7hgVDS0rXas4cKRswC9ob86eR//X+H7Sxmtxe60ZpEZSwR62E7IecRef0fJbhEmSV
         wHLeGzN1VeER7vqvXQKS5RT6UxdTwWnEG0H5lxUrhJeqMi2kDOMFaTHPv8Rhm9oAtpDP
         oR1rtZ2PMbLJ1l/N0z9XAdwx3GTfMsj/wMdT9JVIF/EfjCgBBIuMOXPNo4z2JP1DGBgH
         9k+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WRksbzVPT2Uddn5HJEKIcJ+UIX7ebvy6KUwPylu+F0w=;
        b=te8o1UrzISm76QAm51q+hEDWaz4ADZDQH4G0q0kkjfMBWcgEjMpxTrqh9X6wDO6Pgh
         /ZUTwDR5zcFXTsxJxctTGGn1mG6YK3/eOgpN/DYkcBcob5j5L55M10U052dQ6OlR1Ty3
         7VqOZ8bJOISOfqScj1DkWDu1B1wwxx3FrZYTMVGbCLSRFpK2T4p4vmkjUC52p1UdwULH
         AByXgh3EVbWXFtV07FKuQLagEGOaH9ipawGX8lVCXqIREH4PeY3Dqcd6w15X0OIuGAsT
         NIBuNCk7Lgb867XB7P6H4s1OYUunxtecUrSgjGw9rxoijs/1S7TDXEmkXfFjgVmrXtEW
         XdGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFPthdby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq5-20020a056214258500b0047404b73655si1305042qvb.192.2022.07.21.06.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 06:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFPthdby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEWYV-0003Ix-MX
	for alex.bennee@linaro.org; Thu, 21 Jul 2022 09:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEWTw-0007Zg-V3
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 09:44:49 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEWTv-0001ux-5y
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 09:44:48 -0400
Received: by mail-pf1-x435.google.com with SMTP id 70so1818617pfx.1
 for <qemu-arm@nongnu.org>; Thu, 21 Jul 2022 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WRksbzVPT2Uddn5HJEKIcJ+UIX7ebvy6KUwPylu+F0w=;
 b=DFPthdbypZ6gFaHLp5eAo3EXbTu2/b9ae2VJ3dd/TGVfgtOVH9hTuog2FKT0E52nTf
 swiLy5W4PPxjxKqwUZHAmi0lH/eWEJxulgd9iXCzf4Sn5apF75PC1plzJA3qWpBUsv1a
 8huVnSRCFKcdLXQ9gBTEQRgZPIC9khmt5Oq5TK/kBxDqdBzL6wZJBujDRUiDlnycmeH6
 PViESHVS91QTmhAYAImEbF4GBYi435NnkWefZknffRv87U1ZmhoHSW6Jg4C2ZcYtPsZr
 PABzf574iD0fE0X4bWf4IsJ6dGOcvIirWeD38Ad4mUJshNIlx61VSwCcjduRaRQ11AeJ
 hDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WRksbzVPT2Uddn5HJEKIcJ+UIX7ebvy6KUwPylu+F0w=;
 b=WG/0uGV0O60IBcquRPE/OZZ1IbNSTzThQRHAWK//D+pGCDRBrENyOYSzwXe6cR9p02
 btKeUuD8Yw4SDyCIW/mqmH0ezQKLNTZzL27snAZR4nmhwPbFU9v391IFSehET1opCIIh
 nlINsTOV8gC0xnDbvGmV8sN1iXGEg8y0bYFogjkwVl/BberVbXsVi7BDkvGnqeaUDeTK
 AKOxJBHC8WV+HK3z6xInTrZ1Fk74c4GosvRY6fn398ZKqN+W8+vrihRDQk2ihMnlRRc3
 hOBVlLAKhDQTkTay18xfdW2m6GEJ3lW1MGh7kpKPmZqoya7+T+cnDdt7WFdaXwg59mLA
 gVhQ==
X-Gm-Message-State: AJIora8toH+jqEH26EUAU6LvPQqCAAjazMsKXcwpQmTJ3rect6FmooQ0
 e0KUzVleeRN5f//SyxN2ptDRrnrnLEYFOdVOBUqA/g==
X-Received: by 2002:a65:6b8a:0:b0:3fc:4c06:8a8d with SMTP id
 d10-20020a656b8a000000b003fc4c068a8dmr37780511pgw.83.1658411085276; Thu, 21
 Jul 2022 06:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
 <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
 <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
 <CAFEAcA-cTzrA6fZXw7onDJ77NMwjBrSFVwADYmttCgdOf9ODYw@mail.gmail.com>
 <CAL7npF9H_eKi0jA_m-wV=jSHy9hc6re7TpTe2ni=9NYK4CxRpA@mail.gmail.com>
 <CAFEAcA8xV-BdhvwvkzRHxqqEX9BAwDJGwHS=koBRbDeGHwQHEw@mail.gmail.com>
 <CAL7npF9bOP=bPtyFS-K+HgXGy9+W11M0ELRJMqQp1-JB_jVx1g@mail.gmail.com>
 <CAFEAcA8hbU7PJK-YvOkbjj2F2PBW1M9J10DkHqUPXTSxYOS-5Q@mail.gmail.com>
 <CAL7npF9neZUWweuZFqDkO5mh5=tZj3ybjZUvVoF932cJibpRiw@mail.gmail.com>
 <CAFEAcA9CnC5P4Myf1qMO=DLas93+kSVjNvnj6Vgty_yvdjH5vQ@mail.gmail.com>
 <CAL7npF8KNQKyfeW5ONY53+_u6Q4H8BDtY386Eyt-+gxaXdBBJA@mail.gmail.com>
 <CAFEAcA8hVyCwMbQ_ZNUgw8Nfb3wTvRk3gvUr8RC3gSH7Pkuv_g@mail.gmail.com>
 <CAL7npF897P3=Rro4pe_i_cmO+rUe-b1NqnJtmEM3K0kEF5VC7Q@mail.gmail.com>
In-Reply-To: <CAL7npF897P3=Rro4pe_i_cmO+rUe-b1NqnJtmEM3K0kEF5VC7Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 14:44:04 +0100
Message-ID: <CAFEAcA9y6zwErffpvrJrenS0hyLvGyoyhdF8Vo3mgFhLOvvOSw@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7qRCF8cAwdR+

On Thu, 21 Jul 2022 at 14:10, Jon Alduan <jon.alduan@gmail.com> wrote:
> Yes, exactly. When removing timer 0, time 1 will be removed instead.
> Other timers are not affected. If you create a dummy timer 0, there
> are no more problems (that I can address).

Yeah, but it's complicated, because there are multiple "timer IDs" here:

 * in the guest source code, the "timer_t" type is actually a void*
   (which is why you get compiler warnings about printing it as an
   integer). This timer_t type is provided by the libc, and in glibc
   it's a pointer to a struct that glibc allocates per-timer when
   the guest test program calls the glibc timer_create() function
 * there is the guest kernel timer ID value, which is a 32 bit
   integer. From the guest libc's point of view, when it makes the
   timer_create syscall, the kernel allocates this value, and
   glibc is responsible for mapping back and forth between the
   pointer-value timer_t the guest code uses and the integer value
   the kernel uses
 * within QEMU, we have to manage those guest-kernel timer ID values;
   for our implementation they're always a fixed magic number in
   the high 16 bits, and an index value between 0 and 31 in the
   low 16 bits. QEMU has to map back and forth between the guest
   kernel timer ID values and host glibc timer_t values, because
   it implements the guest syscall by calling the host glibc
   timer_create(). The host timer_t values are pointers, again.
 * the host libc does exactly the same thing as the guest libc
   where it hands out timer_t values which are pointers and
   maps between those and the host kernel's integer timer IDs.

So when we look at the host strace and see "timer ID 0 is being
deleted", that's the host kernel timer ID; and there's a fair
amount of complicated code in the guest between the test program's
"call timer_create()" and when it actually gets into QEMU...

-- PMM
