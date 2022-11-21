Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2583692ejx;
        Mon, 21 Nov 2022 09:36:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6YGoYMUpN6FBD5YHxX3bT+J7pE+7HxN0in9DOpi37KIEok/XRD9vOJaNyt7N6YC7kRebD/
X-Received: by 2002:ac8:66d4:0:b0:3a5:3388:4093 with SMTP id m20-20020ac866d4000000b003a533884093mr18432601qtp.262.1669052179392;
        Mon, 21 Nov 2022 09:36:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669052179; cv=none;
        d=google.com; s=arc-20160816;
        b=ve3S5crNNPOROfj9Wg941mr2wvHsU+N1LDnevdOwwSSvgeKgszXJ3YZvwsHesc37j7
         Z1hpPMXodP2yNSRfP8uX7Dqz6pohYGk2G3ibVz6+ThClHwt5Qr95y5YfSnzfXFmUfIVP
         387c91agyc9K9PdOp/EMte+6kzvYNE72dd0vhYjsfR6rIGuW0gZNCWdnUIzd5Ek3exxf
         2tOVudx6KxAK6xZfERhn6Ag3mCM/3TmxclOLA5PPllTdn5g2SJsmBg71N1DZec34kjP+
         feA+KaQFRj6ZasRWqohaXs6+f0/BLmNEApwleXqAgztAO6VQy96CZHo4ARJDVozULydL
         RvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5GqM5IDMiOwkvWd6cJfGf6BoidyNYvs1Aui8lxWcf3U=;
        b=IAk1lzIjX4pO79a2IBkr7oqMjH2ncCfP7lwcoQQKD0v4Tbn8hW6bTinBgUqYDTGNIk
         zk1k22sefM6/3t1xomvesd8f/Uyb9PHKZ/yfHd8eCn4mfnXDkxRunVdf3hZtDzkwkO+f
         dbol2vkRmQ1n9SfLW8cgUEB8uKIsfM4BGvUwXX7A2uvtmfviIEu3FDFd0RSNrug3bSAA
         4u+NJ7OKsmaB7msoWEG96+MLp82M8QZ7cKpyUtr5YyjkuXm1CAe4x+63oQqAXpDVRjuI
         wllAwyjhhe6iBTG8oT4zNNSIIxb7193xwH7basAbbwq92bpK9YGQAnOPUGNZjA4iAcqN
         YS8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=G2hy9WBe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r22-20020a37a816000000b006fa0c1f449asi5900125qke.621.2022.11.21.09.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Nov 2022 09:36:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=G2hy9WBe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oxAi4-0002Ks-F5; Mon, 21 Nov 2022 12:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1oxAhw-0002KR-MA; Mon, 21 Nov 2022 12:35:48 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1oxAhu-0006Ck-PO; Mon, 21 Nov 2022 12:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1669052142; bh=5GqM5IDMiOwkvWd6cJfGf6BoidyNYvs1Aui8lxWcf3U=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=G2hy9WBeAN46av5yEaVU2u4mrhKAtprQCYYJNH35SQzw33ELnG7bh8/vyg/o89IrF
 oaxHztXr02t1VwE7eBEe7VfD1PwEPyzOR/AiefwssScRqdVmq1L89ovG9l9JWLfa1z
 tG7MD0zAR942iocFg3tGQe4tRsPQg5ZSYRKVosH83+33p0FGkbQvsieVJDHL0sQ/j9
 rBoORzdIeqFcV7A+PU5fAZRVbdxB6GNiCr0UjaD8MO1QyIznqaWJMoDpHrTzd4PUlx
 OVJQNO+jwrgQ362ElEuz6ahD86+sd+kjQoI+6L8FK3tRD0McIoLkoSjLfv4kfSu7TH
 FGPlhHEjkGq2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.189] ([5.199.177.82]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mw9UE-1pFnS60pKW-00sAbR; Mon, 21
 Nov 2022 18:35:42 +0100
Message-ID: <4ebf808a-b4f3-258a-f86f-8f8fa96d381f@gmx.de>
Date: Mon, 21 Nov 2022 18:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu.git v2 3/9] hw/timer/imx_epit: simplify interrupt
 logic
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-3@git.sr.ht>
 <CAFEAcA8e13HHR7yyFv7kWNOrMuPTtsHMTChyN8=Q3z6VFveXCQ@mail.gmail.com>
Content-Language: de-DE
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <CAFEAcA8e13HHR7yyFv7kWNOrMuPTtsHMTChyN8=Q3z6VFveXCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:U/q5ftXTPg2lJ7uoDNUUn2Ty2cIa9NvYQGvtxLGkIJfQU/vQ4kx
 hPWH0eemBBeVGVQcPXZynyEj0DbJarwcA2IBDuP8TXsPteAd3u1Kvs/EDjFt3rRD1cwbidi
 lPM2sMhoCwWzt51dClgPFyb5Tz+su/Rzr7UO/2Nr+rpk4m84p6WiUHaiQJBnEI13OLl/7M1
 vIxIZwX+MRYLF0bdV+Ibg==
UI-OutboundReport: notjunk:1;M01:P0:/78v5ud+feA=;esbhKSCajiTLwVk20lqJQiVs1Za
 6f13nczDH4Bbjt5F5I9+IPzCFkMv+XCTwqUGvaBdWG41V9qF9NR0ljBUNmEy8lcPI61cUF9M0
 55u0Thc79AbQN1GO+XiVZsBoINbJTy+qDDqIRM4mvtnec+ujfcH2g3WhTwuv97jtUfip2k38N
 C2UIKkkcI4gXEb3Hy4/dmLeXuWZ2lThvjgUByavagB2lgHfvpVLU1yWpwkQgC3Yt8JpkMxYI1
 84II8Qp61woIONIzMPBj7KpOlNB55zNdH0app83dmJpDJ6zg3dBD2iEAB6hh8qTztSVZ5cfI/
 zOqhrPUzmTlHpG3vcOi02iltj5b/ObQ2CGVzSRISHklBM2nSsEBB7tq1ozxqL5fCItzqQvc5j
 MEUzuZxaBQxY61mzC60vhICkZa1UwSwm+Bf4XtnXH+pOFiC43ZF4TefGoRHEEvIHdO96gq6xm
 dGu7tfhgVObPsVJ9JhzrFjfHLCnRdQwh3enWvVXyzgC/YbW+mtt9PLIlTdu8n2qV0ul51VHoM
 XJznFBlnmallLjMXpGy+Rc04x+0S+XstYFWgDjy0IeO/8ZTn1+BmmsG3q4tXQLB5br9BANrIm
 /hyXZgh0A2GCSdbHHG+iiiyEvQNWafD/ymmnprzTR/dZH16EeaaRsyTXJi+E1FNrfOwPEYgFi
 fTQ23CGHW74A7Y2JaoXQHp5Im/oO1Ir5HpYaScQ3CVMkwMu0RUw23KTHqRLWs7vhkKkk+pM2i
 VnQYArp03BNJgqaT64mHbIeRK4lNsXhUXl3T+p7gbBtbNSC0R5ej3LEgFijnPHXV4oPmUgwgN
 ZMzrc5+yiWQ5d/5H+7E47MjufcxI5B4ftVdg3jwjIdRMCp6mdrDUCkd8KBl3XDVRGUdt5nAi6
 nDIuTgwhGdUzLG/uvAj042pQiQKKEF3zQE0AS9kK0bv9fFXePOa82Tk1039d2iZPcY+q8/Q4A
 zW2R2w==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: l/W30WiHXiEB



> Having an "update interrupt" function is the more common
> convention in QEMU device models -- it means you have one
> function you can call from any point where you've updated
> any of the state that affects whether an interrupt is generated or not.

Ok, will keept it.

> For instance there's currently I think a bug where when the
> guest writes to the CR register and changes the value of
> the CR_OCIEN bit we aren't updating the state of the IRQ line.
> If you keep the imx_epit_update_int() function then fixing
> that bug is fairly straightforward: you just need to call it
> in the appropriate place. Without the function then the
> logic of "what is the IRQ line state given the current
> device register state" ends up dispersed across the device
> model code and potentially duplicated.

That bug is fixed for the next iteration of this patch set.

Axel
