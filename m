Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp916979lfg;
        Fri, 5 Aug 2022 03:10:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6tk9HrWcBD0QaBcc0ec0o3XRh2Jt1mkeSTiabebqv5HAw5Ri7W9OWP96dQzxRRF6JEw89z
X-Received: by 2002:a05:620a:4005:b0:6b8:94bf:f1a with SMTP id h5-20020a05620a400500b006b894bf0f1amr4458770qko.411.1659694216502;
        Fri, 05 Aug 2022 03:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659694216; cv=none;
        d=google.com; s=arc-20160816;
        b=XXzYCYctOuXaTNGGJgLtHulz/+fwtldBHqqfsG/2SnNH4eCuyiBmkUD1Cw9f836lgw
         GlO8DfP1t7kcuoDcUPGmeYBns3b3nOIeQPJJRNNiF5inWln6U/Y7th45B7nTkFI08j54
         d2n++GB2swLlCh8M6mtW0hdCqkdbH3nxShDDhUCQlstfdkTGC0YJ/wfBqqrfITxnx+89
         7DvvBLt6wHal1ohKRD0kJtPWz8fwY3/ZVIY5IyUPJ8OOGeaKDX7a0ngnY6rOXUZ7gImd
         YQWqs6Pak6X4Tprmjm+cLcS31LsmlXCYx61j0BO81u5ptPxktiz9iuH7LJpcpZd6lMkZ
         DaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WOiasc3e4HbrmFqNIusUtdACSI4NdnfWZoRWETcUpVI=;
        b=YcGSnuAkGANMpPh00+B1jnpb1eZdlldnbzFeqEI3tVhwHVDOjpE3FJujmce7eLsLR5
         avy8KZKlHxq1aaDRkBvS9hQfgK45vkP847o6DGkn7LOLBdmTczy5hqiDdy3Kg3k/fsSq
         MneiMGAKOMf8rSddiy8gOhV+0S2unpVGHksGEDH9gKZgK3ritJ2+umsEkyVaFEhrbAdj
         O8rvZc8WHFvALMX0sQpNy84dupcfj3m8TBdIg9rI1+7SOXj+q8NKCLhtW3GgOjMZzhZY
         t3un0tY6wNevkMIN8owIuY8POoQHrMq3ABg02fzOaytZoJC6BSz3IqJmImQzbB3do5dO
         y/Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dyli2WYo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05621419cb00b00474893f9086si2461589qvc.282.2022.08.05.03.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Aug 2022 03:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dyli2WYo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJuHX-000813-TF
	for alex.bennee@linaro.org; Fri, 05 Aug 2022 06:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJu1B-0006dT-BT
 for qemu-arm@nongnu.org; Fri, 05 Aug 2022 05:53:24 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:41644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJu19-0003k4-Pw
 for qemu-arm@nongnu.org; Fri, 05 Aug 2022 05:53:21 -0400
Received: by mail-yb1-xb30.google.com with SMTP id y127so3009645yby.8
 for <qemu-arm@nongnu.org>; Fri, 05 Aug 2022 02:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=WOiasc3e4HbrmFqNIusUtdACSI4NdnfWZoRWETcUpVI=;
 b=Dyli2WYo4ur6nBoJgRu4O/aZCBlAa7WzYyvcSLJ2TvHh/hjPVRm2sdIhb7r51gmWhl
 veaRe0axwo7LV7h+qT0XUOSefOXztcFrLGpXmX2oElyJeAbpjxf7mpia3B1xKp4aGtc0
 cWckeT24wzGKJPMIqGgmvJNNDiIrBs6tSdsHgPyy3cImlTyXA8iMetArpgt5jxR3jJf9
 nR5LRSccDYkxqm8DTY2o5+kwoWFSpQUCLjA5qyKr7jZ+qXSwdo+Kqw8+E6HBp9356Qxc
 o/it8BHL5yduYZoC71MA4dz02moOXcFQZoCQ0QgIiCIfkUg1lqT99uWp5XQS9e4bJ4ds
 7cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=WOiasc3e4HbrmFqNIusUtdACSI4NdnfWZoRWETcUpVI=;
 b=RwJ6Yr44pEPpbG9d+MA+TekpkDxZmHS4oCgCkMXagApMm96q7P0Z+JnVZFh0fHB1zh
 nX/YK8W27hfbbACkTw2jeDP0H3G0cj8eQjOZ3yZIZzeq4YgSPzuhaD8Rb9ZV6NsoZrGQ
 WEeljThUsp+Iax/TqhP5g9zw3syi8TqMgi3/AKbXxdlz1YIhjwV/C4dLjcEqJZWBHcCs
 sRGFYpJqhaJwNLBDIuDRquUB/vMqE2d9uisjwxY/kUZJAIlJVD4F/tAXNp5LV0/goyOO
 ieRR091yxgKkB3HNnxFG9gy2JgRnTFA/hxJQ+YRyPwMLD2MCvZGJ77Dp9EbvUUusxejM
 WTjg==
X-Gm-Message-State: ACgBeo1gIc1lGQyRlXsVynZU0LWqwwi5uSzBlz0IuOv/vlSc76/UKIYU
 UbMaiDqm4nF+klVFUz2WiS6RIBsqZ5MXRGtf+kW1hA==
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr4720304ybn.479.1659693198756; Fri, 05
 Aug 2022 02:53:18 -0700 (PDT)
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
 <CAFEAcA9y6zwErffpvrJrenS0hyLvGyoyhdF8Vo3mgFhLOvvOSw@mail.gmail.com>
 <CAFEAcA-9F6QDzEiAfiMa=DUVK3LGe9vLmD_OcMTfbU8ayv3Ffw@mail.gmail.com>
 <CAL7npF839onoBJxewXraSGRPmbK=8SqbPeU2W3YN7kFYW6j9tQ@mail.gmail.com>
 <CAFEAcA8wfEfxZh4NFpbDAsB=Rz=9-UcafOWbEtGkJ1WGZs71WQ@mail.gmail.com>
 <CAFEAcA9GdtaUmn_Ft3uYobfwNX0wkg2tDUTC2uS2erim32W8YA@mail.gmail.com>
 <CAL7npF89woO0-rXJkc2chvAwpH+mtbBnz+QZt8q2B+YY=hb2FQ@mail.gmail.com>
In-Reply-To: <CAL7npF89woO0-rXJkc2chvAwpH+mtbBnz+QZt8q2B+YY=hb2FQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Aug 2022 10:53:07 +0100
Message-ID: <CAFEAcA9ebpwR+ScdOpjGktkPz8FNDddPY=Ccj3UFQWznPHL=0Q@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: V9sL4iu6AizI

On Fri, 5 Aug 2022 at 10:22, Jon Alduan <jon.alduan@gmail.com> wrote:
>
> Hello Peter,
>
> I did some more tests and saw that you have limited the max. number of POSIX timers at any time to 32. Do you have any special reason to do that?


That limit is unchanged from the previous behaviour: I
merely left it the way it was.

thanks
-- PMM
