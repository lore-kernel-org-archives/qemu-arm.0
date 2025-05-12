Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2769546njb;
        Mon, 12 May 2025 07:41:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1FhTcBE69E7ohGaCeMOW3ls3t842Nw8pWKNBozGsS7LYkmWny+mVoi/Eo1tteulGSL8GtbRReaRtJXg==@linaro.org
X-Google-Smtp-Source: AGHT+IH3aaJLw+HgMh4jdNW8U9+09GaRoK9IgezjPZG+QKAohAlZomxyqaE33xzxbFLzOpK7VyrE
X-Received: by 2002:a05:6214:8d:b0:6f6:e7ba:83c5 with SMTP id 6a1803df08f44-6f6e7ba8447mr125453066d6.29.1747060913693;
        Mon, 12 May 2025 07:41:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747060913; cv=none;
        d=google.com; s=arc-20240605;
        b=kxEj7JZlXdtzOF78NTqTHhXPjcV83P86lCW2VWhnc3xMWdGP0OP+NIv7X3WWw4aUQZ
         4n/Xn7VHZDWy0kcUcPizMt1nsqEwDcXDj6PMLs3dNFwHzOy7ocflvd18lUGzgMxGNPnL
         ygfsop4NsECIgJTp4k6k5HTalMDsmTsqb0uvb3Qg02DTFOhUpVqtVOcu0bu41QlXAoTm
         TI9QKh48LY0CoGfp+R0zh8Et+43eLwkPd2HdcOv+sHhbUP0qq9fx5qBkAtZLVrwL51el
         HqhSNwxM8/AJpRTehOarPe/f+6PoSvYMDUNtCOicKbyOY45Pm1eAPa8/s/pUO+Z1Oem+
         FtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=4d4YBJ0+n8f1xwDhJd3Y0pI66pBwlrMHwokzfZnjvjA=;
        fh=p9o0XcjsulIReoPvwNrM/h4B68cSUkm0XQ5iVooRGWM=;
        b=G3fIhy51OqOL0/T15D+QRpr6LZc0fhbZfZID/A6DppqA28mVSnKdYJ6WSrxTIe6oik
         4ZW26Ws0EPOlksCgWEF4PzUlrI403ugYCmFZLtAOKpojvXro5QDp61gPLKOvbsMuKdoy
         C9niXEAEWcYDQfZqzqTfbWFf+R4PBID851XAXxqh1yFg8yN4JAVGGN+Hn8R9M7tWYYqn
         K4pcL0FYfxpUFlHO+JgirK1dYQgg/iKtILjVCb6Z6JCAhraH1ZeGo4uhOnSWBkotg+ys
         nutjzyDSL7TBEAUeJRqxEkoCnyX+ZEH8gu2YGM3PJGji6j0YYOZZJTJ5uzwfNB/eiHOp
         H6sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945258399bsi85721381cf.441.2025.05.12.07.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 07:41:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEULD-0004bE-RU; Mon, 12 May 2025 10:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1uEULB-0004ah-M5; Mon, 12 May 2025 10:41:13 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1uEUL9-0000Di-3y; Mon, 12 May 2025 10:41:13 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0683755BC03;
 Mon, 12 May 2025 16:41:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id Z7rQEdTdCDjh; Mon, 12 May 2025 16:41:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DEB0955BC02; Mon, 12 May 2025 16:41:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DB06B745682;
 Mon, 12 May 2025 16:41:00 +0200 (CEST)
Date: Mon, 12 May 2025 16:41:00 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Xiaoyao Li <xiaoyao.li@intel.com>
cc: Markus Armbruster <armbru@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha <anisinha@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?ISO-8859-15?Q?Cl=E9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>, 
 qemu-arm@nongnu.org, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: Re: How to mark internal properties
In-Reply-To: <e5a305cc-4c8b-48df-99fe-539ebd9b72f9@intel.com>
Message-ID: <f342557b-e589-f51d-cfd8-04f97e9c5efd@eik.bme.hu>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-13-philmd@linaro.org>
 <23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com> <aB2vjuT07EuO6JSQ@intel.com>
 <2f526570-7ab0-479c-967c-b3f95f9f19e3@redhat.com>
 <CAFEAcA-kuHvxjuV_cMh-Px3C-k2Gd51jFqhwndO52vm++M_jAA@mail.gmail.com>
 <aCG6MuDLrQpoTqpg@redhat.com> <87jz6mqeu5.fsf@pond.sub.org>
 <e5a305cc-4c8b-48df-99fe-539ebd9b72f9@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2120470484-1747060860=:11021"
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XFvS0/w3pGDl

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2120470484-1747060860=:11021
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 12 May 2025, Xiaoyao Li wrote:
> On 5/12/2025 6:54 PM, Markus Armbruster wrote:
>> Daniel P. Berrangé<berrange@redhat.com> writes:
>>> On Mon, May 12, 2025 at 09:46:30AM +0100, Peter Maydell wrote:
>>>> On Fri, 9 May 2025 at 11:04, Thomas Huth<thuth@redhat.com> wrote:
>>>>> Thanks for your clarifications, Zhao! But I think this shows again the
>>>>> problem that we have hit a couple of times in the past already: 
>>>>> Properties
>>>>> are currently used for both, config knobs for the users and internal
>>>>> switches for configuration of the machine. We lack a proper way to say 
>>>>> "this
>>>>> property is usable for the user" and "this property is meant for 
>>>>> internal
>>>>> configuration only".
>>>>> 
>>>>> I wonder whether we could maybe come up with a naming scheme to better
>>>>> distinguish the two sets, e.g. by using a prefix similar to the "x-" 
>>>>> prefix
>>>>> for experimental properties? We could e.g. say that all properties 
>>>>> starting
>>>>> with a "q-" are meant for QEMU-internal configuration only or something
>>>>> similar (and maybe even hide those from the default help output when 
>>>>> running
>>>>> "-device xyz,help" ?)? Anybody any opinions or better ideas on this?
>>>> I think a q-prefix is potentially a bit clunky unless we also have
>>>> infrastructure to say eg DEFINE_INTERNAL_PROP_BOOL("foo", ...)
>>>> and have it auto-add the prefix, and to have the C APIs for
>>>> setting properties search for both "foo" and "q-foo" so you
>>>> don't have to write qdev_prop_set_bit(dev, "q-foo", ...).
>
>> If we make intent explicit with DEFINE_INTERNAL_PROP_FOO(), is repeating
>> intent in the name useful?
>
> +1 for DEFINE_INTERNAL_PROP_FOO(). I have the same thought.
>
> We need something in code to restrict the *internal* property really 
> internal, i.e., not user settable. What the name of the property is doesn't 
> matter.

What's an internal property? Properties are there to make some field of an 
object introspectable and settable from command line and QEMU monitor or 
other external interfaces. If that's not needed for something why is it 
defined as a property in the first place and not just e.g. C accessor 
functions as part of the device's interface instead? I think this may be 
overusing QOM for things that may not need it and adding complexity where 
not needed. It reminds me of patches that wanted to export via-ide IRQs or 
ISA IRQs just to be able to connect them to other parts _of the same chip_ 
becuase this chip is modeled as multiple QOM objects for reusing code from 
those. But in reality the chip does not have such pins and these are 
internal connections so I think it would be better to model these as 
functions and not QOM constructs that the user can change. In general, if 
the device or object has an external connection or a knob that the user 
may need to change or connect to another device (like building a board 
from parts you can wire pins together) then those need properties or 
qemu_irqs but other "internal properties" may need some other way to 
access and often simple accessor functions are enough for this as these 
internal properties are only accessed form the code. That way we would not 
need even more complexity to hide these from the user, instead of that 
just don't expose them but use something else where a property is not 
needed. A property is just like an accessor function with additional 
complexity to expose it to other interfaces so it's externally settable 
and introspectable but we don't need those for internal properties so we 
can drop that complexity and get back to the accessor function at the 
bottom of it.

Regards,
BALATON Zoltan
--3866299591-2120470484-1747060860=:11021--
