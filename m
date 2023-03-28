Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2857732ejb;
        Tue, 28 Mar 2023 11:27:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set8DIXMEg8XVLMkakIGc09Eul+oCkoO5Jrgl8s6PliNecgR0zCQg6kO+OnYBGmXFk2Od/8Ra
X-Received: by 2002:a05:622a:3ce:b0:3db:2064:ad6a with SMTP id k14-20020a05622a03ce00b003db2064ad6amr25152852qtx.66.1680028055688;
        Tue, 28 Mar 2023 11:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680028055; cv=none;
        d=google.com; s=arc-20160816;
        b=H3b+cJlZZJBsx1cajNw+6kxQGFxkCp+Ms3k/+Mc//jSMjVLgk9RE0rGd5/8yvRoiIb
         whHNfiMXBuDB9xAuuqQeoc9KLsFIqMESLlxYaVCTfODuWsCqc8z28QoAf/zjyr3uBG6+
         6u/5/8JJeux66uidatA4yYS2yod1M3idP0MclfFK6BITKhEGhcBmyrS/Xb/8Zr42jowG
         QCW6hdY+cP7xNnt1oi1XPMkA8VpZK1lQgvzKVjhkLBKdaYo60Qp5YpbsoVzHT9MWE1Fp
         CEd03ELfYbVAqF39GjRYax3adPOd+unN0uO326UldVUqQo2ZUcT3vCktq8VOlNX7VodA
         51wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TYguWfh+37fhYDpY7uw0msis6sE1Qef/hZCA1oZumgk=;
        b=wsj0ZBRWmh61j1GgbFMOxU1Nkv3LZkjcBwAgNdWwbaJeah5h3rfauskX3rWHWvSqIY
         beuFoFFm5V8GDrFAMwklc0FXurP3UnLSVhLm3akJgidu1NQqpfaUtq/emDlxAVsMF2XM
         PqbE35/a03ZWnbaeZ34GyCa9CmoLOqQqNvk4x7sfv8bsFJ5kunn+gjIZfAqMjWlmD6db
         GQGNr5v3Gk77lOmwZCOR1BFyditdK5Nz7i7Gquv7hYTiN44dShWHiIzfsVI5yvtK8XV7
         MyA8DRhYGuuuTo6qqRjD+eA+0uhdqY6ZpexDU087r9K2iTFz4iWGyzgLvAjWqVBxBUjW
         64KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrjiLkyM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22-20020ac85896000000b003b8df60b65asi9393969qta.181.2023.03.28.11.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 11:27:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrjiLkyM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phE2U-000348-AG; Tue, 28 Mar 2023 14:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phE2Q-0002xJ-JG
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 14:27:18 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phE2P-0002kB-2D
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 14:27:18 -0400
Received: by mail-ed1-x535.google.com with SMTP id cn12so53471900edb.4
 for <qemu-arm@nongnu.org>; Tue, 28 Mar 2023 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680028035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TYguWfh+37fhYDpY7uw0msis6sE1Qef/hZCA1oZumgk=;
 b=CrjiLkyMUPJ//A69ZIwZ8OjrhrdTQvSq5FS1VgsvYGbD3VWeicOUp+891h7zIjCU4r
 uzmSn2HR4EJVAzi2LOkFnsOtvXr1SCAC27XS5puOBQDDobEOdh83OAFZo0489b7UgUCF
 qu2Ny5J/kglC8Z9z0oSqMz4E1Of1swjlSNdi7JgdpupIvdWlMWoGS2h8lOtX6Me4WkNk
 It1NHQrilWBFiwK2GbzEG0iOKybqNoxA145zyHrdHlONKGnlHjMPA7wd5tEZNS5DmElU
 tbe81B5I+5UU6DFNb83hgBB6HOg9wBtkSxOfmeosYcCYP1GeelRu7HMxE71BUk9fxpNA
 +8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680028035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TYguWfh+37fhYDpY7uw0msis6sE1Qef/hZCA1oZumgk=;
 b=X0/aKhiI4c+oto5UztIJEXvC3jHfgFgfyptMGmXcotGv6YPVOPUkLPjVWgW7g5uZIq
 O+F1F/mJeGbj+DmHFjeTMtwKvoPrZ2qqj46noFlzo3/tX2ovTkG2UZhm+2In9yvUwNsd
 oURU6DADwOqZNzpFIBOiRjEOFNlXn4b8pN8i7eEJO5x66JLX45qE57LejXWrQBj1J+ek
 pmUGhZxbtj5Lmrf8ceH6j68svjYJGw994z27zeAKDFf3utW7T6EGpe//V30nfoPsTu7Z
 NTu5cYC3aq1ij+QJhAA8PVaBcIMWV/mA/vCUOFOdiZPZuPfCtLkzGPP0HszwPhvbTl6R
 iUeA==
X-Gm-Message-State: AAQBX9dh71BzmsUbRmR6lkzDR3KRdoA1m3khkUXZMf5kNUVshr0oqHbK
 taQqU6HBgAYzEoLa41almJvrAQ3uxOJOaL3LhmHi1A==
X-Received: by 2002:a17:906:4ac5:b0:92f:cbfe:1635 with SMTP id
 u5-20020a1709064ac500b0092fcbfe1635mr8670975ejt.6.1680028035009; Tue, 28 Mar
 2023 11:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230328162814.2190220-1-peter.maydell@linaro.org>
 <e9e8fb66-3fe8-2519-95df-6ba6c52d53df@linaro.org>
In-Reply-To: <e9e8fb66-3fe8-2519-95df-6ba6c52d53df@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 19:27:04 +0100
Message-ID: <CAFEAcA_TGN7qk8YQz8MPbdg=jcT-HQVFWBfnEO53AAPyXBmqTQ@mail.gmail.com>
Subject: Re: [PATCH for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lfxNuW+QMDvv

On Tue, 28 Mar 2023 at 18:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/28/23 09:28, Peter Maydell wrote:
> > +            /*
> > +             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
> > +             * but since we're conditionally branching over it, we want
> > +             * to retain the existing value.
> > +             */
> > +            old_is_jmp = s->base.is_jmp;
> >               gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
> > +            s->base.is_jmp = old_is_jmp;
>
> A third solution is to simply set is_jmp = DISAS_NEXT here.

I wasn't confident enough that the previous is_jmp had
to be DISAS_NEXT to do that -- there are a lot of
different values and it's not clear to me which are ones you
might find lying around in is_jmp at the start of an insn.

I like the set_disas_label() idea, but maybe for 8.1 at this
point...

thanks
-- PMM
