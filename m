Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1444526ejy;
        Mon, 19 Sep 2022 16:31:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Q4jK/UKA2SJWbsg3Vj/VysC5u5U9vSoct6GLFeUCFop9PSay7ejFawwmihDPauBq7zJJd
X-Received: by 2002:a17:907:97c2:b0:780:6a13:53 with SMTP id js2-20020a17090797c200b007806a130053mr14765215ejc.187.1663630307236;
        Mon, 19 Sep 2022 16:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663630307; cv=none;
        d=google.com; s=arc-20160816;
        b=MNmVmz9KTSfFgfMQRRlX97slEWBX2lddeukGpjq9/waz/wRiJ6dIaycFtx6Lu+jIud
         ldcql8ubyTCCzeg5Jd5KcmuFlLsaPu5+LVqfhYqvBDsBHzKOy1Jc7gA9evAqbbVsGiqt
         OUin/7lyzt0o6ocH5qvg5ijI8yUIkmWUHSGf7+2bHnZDiU7q0HGPwGdx8cXvOevGYDbD
         IYa8YuCLCWvR9wqOYSG2WUkGwj2KfnyCzbX+cFiJn8j0cdiX/7AslwTicVMQ0cMHAIbc
         xei9sZbWfyKauWZGFz/ZyoH9dWoq2mrbt5yRmiNDkhtzdac5AlRrPamij5fIaCrv15VD
         5q/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=NSIvRNfXT4BgiWoAffM4RsDVDd2SOkBJz5nw83+ZE0Q=;
        b=ByfhyDeCsdxMxtaq6dlO6x4Eqs+ufkI6H+5p86QOO99eqkmLvrIJ7OsIS363f958ft
         jQFYaSu93mXez8x1CubVugP9E4i8DjH8FTkflxUYuXiuTeHBlee2qApLtJDzjAQNFdPi
         EZoQpowo2JY9sIUQ/uvKgOzSsoIa2H8O1HeRU066mTIHbVOBW8pB3edKgJS/d4lUgYU6
         seqRvD/YEywbEJ8b4pLeXGwrKXphnHmeLSu/93Gb6S7C9TfkQb1p1E+EpEl92Zztf04F
         NhwIES6MVRUSafqfDXphQKHMu+vGnxs+MieAt9s9KlNarT9fimfkC0wb/SauWgAaXoS8
         HXiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dIO7rKlw;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id xg14-20020a170907320e00b0077f92be81adsi27369825ejb.212.2022.09.19.16.31.47;
        Mon, 19 Sep 2022 16:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dIO7rKlw;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiISXbp (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Mon, 19 Sep 2022 19:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiISXbk (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 19 Sep 2022 19:31:40 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C834F3A1
        for <kvm@vger.kernel.org>; Mon, 19 Sep 2022 16:31:37 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so8958516pjq.3
        for <kvm@vger.kernel.org>; Mon, 19 Sep 2022 16:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NSIvRNfXT4BgiWoAffM4RsDVDd2SOkBJz5nw83+ZE0Q=;
        b=dIO7rKlwpt1a4Rr55TM/1OaCkqXzxn5HQ5hnLXBRwWHTkpqxju5K46xUcpujcqqOhY
         UT1qtY65c18HaDPPSpvVTvhQ9+fVBIzAfgdO1ePcqTnS8abQ/ssqUdN4PA8+BBbGscY4
         zcHOxvhGd/Rw79kJ916G+ztNW9eW1CWpGEOd7bJnYuq86Ev2kMsm0q8+XzwBszG8pjQ2
         Pve2h3B9fmVc6VWU3tTQ2teTgIPA46kmE7p9DGMxzzCgzN9yNZgGgirx1IC7zm5IGED/
         gjezyCWZTWWjo3xYAtiH58mh8QAjO7bV/tNRRbQG7XhlchTkciQZvl7gHKj0RWl+10FH
         DxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NSIvRNfXT4BgiWoAffM4RsDVDd2SOkBJz5nw83+ZE0Q=;
        b=CXStVoGmN9vI44bXfu41vCeTjxrhshPxZzscz7NRvasTjj3yypMX6GLZEY00DIVOM+
         G+0h8BvWaeU9GlNS1sy5DAWlNjw5KbCJ23LCe54t1Ahh4gNp9piamF3zuoMby09tg4nU
         DTYFwYpsGzJzNfcvC1U7YL+c2dPjTpq2pAQ0oQHnvhRBRLDRSu6ZXNqoMWa5Urx017FV
         3aRfFOvqfBUhLHto5FsnkPwxgYK7/aSJerB77i0ONuX6YyZu/quNjgsuPS8kRSDVxs8/
         fIli/TualMThd/fwKomwW4cmp4zorODUbnJOs5Hmc6+VRJOi1UymYwtv2A3Tq2Szw7PQ
         8IEw==
X-Gm-Message-State: ACrzQf03MZVV+XFTE3hugNmIwpjpx39Z2x5l/B3oDYWvqlsOg4i95Io8
        /tff55gWuYVegkYpl6vemzOYS8poNRhID82dvKc=
X-Received: by 2002:a17:90b:1b50:b0:202:f495:6b43 with SMTP id
 nv16-20020a17090b1b5000b00202f4956b43mr680878pjb.85.1663630296957; Mon, 19
 Sep 2022 16:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220919231720.163121-1-shentey@gmail.com> <20220919231720.163121-2-shentey@gmail.com>
In-Reply-To: <20220919231720.163121-2-shentey@gmail.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Tue, 20 Sep 2022 09:31:10 +1000
Message-ID: <CAKmqyKN+V2R8PkED67tB8+pCZs9369ViiL8OZ9XhO3SdUCk5=Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
To:     Bernhard Beschow <shentey@gmail.com>
Cc:     "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Bandan Das <bsd@redhat.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Sergio Lopez <slp@redhat.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Xiaojuan Yang <yangxiaojuan@loongson.cn>,
        Cameron Esfahani <dirty@apple.com>,
        Michael Rolnik <mrolnik@gmail.com>,
        Song Gao <gaosong@loongson.cn>,
        Jagannathan Raman <jag.raman@oracle.com>,
        Greg Kurz <groug@kaod.org>,
        Kamil Rytarowski <kamil@netbsd.org>,
        Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Markus Armbruster <armbru@redhat.com>,
        Eric Auger <eric.auger@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Qemu-block <qemu-block@nongnu.org>,
        Eduardo Habkost <eduardo@habkost.net>,
        =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
        "open list:New World" <qemu-ppc@nongnu.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Helge Deller <deller@gmx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
        "open list:RISC-V" <qemu-riscv@nongnu.org>,
        Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>,
        Havard Skinnemoen <hskinnemoen@google.com>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Alexander Graf <agraf@csgraf.de>,
        Thomas Huth <thuth@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Wenchao Wang <wenchao.wang@intel.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        qemu-s390x <qemu-s390x@nongnu.org>,
        =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Eric Farman <farman@linux.ibm.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Alexander Bulekov <alxndr@bu.edu>,
        Yanan Wang <wangyanan55@huawei.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        "open list:X86" <xen-devel@lists.xenproject.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Snow <jsnow@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Darren Kenny <darren.kenny@oracle.com>,
        "open list:Overall" <kvm@vger.kernel.org>,
        Qiuhao Li <Qiuhao.Li@outlook.com>,
        John G Johnson <john.g.johnson@oracle.com>,
        Bin Meng <bin.meng@windriver.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        Jason Wang <jasowang@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Alistair Francis <alistair@alistair23.me>,
        Jason Herne <jjherne@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: WWfjmd49PEfs

On Tue, Sep 20, 2022 at 9:18 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
> inherit from TYPE_MACHINE. This is an inconsistency which can cause
> undefined behavior such as memory corruption.
>
> Change SiFiveEState to inherit from MachineState since it is registered
> as a machine.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/riscv/sifive_e.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 83604da805..d738745925 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -22,6 +22,7 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_cpu.h"
>  #include "hw/gpio/sifive_gpio.h"
> +#include "hw/boards.h"
>
>  #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
>  #define RISCV_E_SOC(obj) \
> @@ -41,7 +42,7 @@ typedef struct SiFiveESoCState {
>
>  typedef struct SiFiveEState {
>      /*< private >*/
> -    SysBusDevice parent_obj;
> +    MachineState parent_obj;
>
>      /*< public >*/
>      SiFiveESoCState soc;
> --
> 2.37.3
>
>
