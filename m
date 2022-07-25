Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp776726lfg;
        Mon, 25 Jul 2022 04:08:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vV/yNn1mOiYdX8DvWmdilnz9Y9rNV0Ie5HwGmj9Jb/rpstbjJK1P6/9FzUetGIjzgPU2D7
X-Received: by 2002:ac8:7c4e:0:b0:31f:36ad:e809 with SMTP id o14-20020ac87c4e000000b0031f36ade809mr4144047qtv.441.1658747310479;
        Mon, 25 Jul 2022 04:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658747310; cv=none;
        d=google.com; s=arc-20160816;
        b=eRpQMOCYdi5Iyrnp1D8nIlMiyUcJ3vtubBpBs3uprmcRcyNf7s2/n03hD+m/uwvACs
         suMxcZ5UJ55jVzQt2KZ+jtKwSY7ly37CH3Eks4fkHwlqAuFPoNmTABpHmhoMdOffHiQD
         jiGinmDX3zpL+pAVvwhf/Neuf2a7Qakm9k2qJNZ90UgGCwLvt+o+tDoUzlPNocH5SIWL
         HRFx/AkTniybb8xmSW8f3j10H1upZgC0BXDtIJdZcV+4Rkvm/bhNJ5IifSqqancUxo8e
         vHUfj/1PO7/95kP8gXjzMG2+KEutznCfpr+2Mx3aAL8lliF16Yxsg7btj25mrmsIgFwZ
         ne6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RZ5SNMxvTow6QcL0EBB2ikvEctsDP03QNoZc6ott1as=;
        b=1LGCcUmQe5vJ5Qlnx/Dn9dTBdJ2QqOSQAFyDcuL+3hdbQlWXj/fVGYxg4UPQvV7BcK
         XMaFywPXmoqu7YtfKp8MawKPlJDGq/xxm44c+oQYQJ6T+9gGRXpJJkx+e6Fz2V6jY9v3
         SEOxyuTHCK05PZucAzKt2Euhyrwz6WaW8VAdNfr4EQ1cSWSCVA/BpRZXzhgAaeBNijd/
         icblILAQAnYKXc/RG+HGAVE0D5bEjW6jYJpi7tq1YVXYLQeoIRE3y82Ov/RgDiNax01F
         qpc6j8ncuvZXYy7cbZjWZvWsgEk6ijDze0ouGD76kc9SDjgUEIskmPDwoNAl8EOjCZ3b
         evzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dfgvdlhk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs23-20020ac86f17000000b0031f1cf6710esi6454624qtb.119.2022.07.25.04.08.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 04:08:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dfgvdlhk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oFvwr-0001cj-W0
	for alex.bennee@linaro.org; Mon, 25 Jul 2022 07:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFvwR-0001bG-6V
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 07:08:03 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:46946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oFvwP-0001SL-B3
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 07:08:02 -0400
Received: by mail-yb1-xb30.google.com with SMTP id 65so4624608ybd.13
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 04:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RZ5SNMxvTow6QcL0EBB2ikvEctsDP03QNoZc6ott1as=;
 b=dfgvdlhkBRRQR8UT7080Dp1aAr5qoV/4b1UO8oQ7tTMKy2lpChRXArk0OTGe0AE8l4
 JygPKO0sNvfJsfczPTqParpDZrj8/frOzBQwnmoaSdQfgNDRy6F54XCjs0aSAbWF5xT1
 +ce7nyIy2SReY/n8GD7XsC5d8EDLYdSjCGEK6yDJBrLu2Xlj4ea4H0YoG51iTv8aBOUv
 toQVE3wj+FOsKbgHGq0LGala4cNSUCWSYwX7gzWHiTELhKR35/PI62AE0FN3NanjxTiC
 IdWX/pcIdOdOT1Axo/JvtcsqN+5RBT9mXcAhK7MG1Mpvl1NrFl20DjarmTA1AVgsn+mW
 lPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RZ5SNMxvTow6QcL0EBB2ikvEctsDP03QNoZc6ott1as=;
 b=NlbtuwEU7GPCHyW3a9X9ISbs6nkXz179FuKHCO8cWpOldqQnNZnei/J9eMBK2hfDAV
 PwgE92FSWB4Q9jLDt3n0BODd83UjuZVmdgmWUH66N6eIvBRRQ9qws1Ac4XHtEZCrPAH1
 Sr5RI5Xih17NyxsiupNeQTiJL8mxJGTANSTmyNFUQPFgFDLzBDq62ISucqNL+LNcZCDM
 HfflCxbMsJF5M6O/zRcgFkIKtTsZyXBzgrwWEvumYKIXFTbX2/hRAuIwXdEHBaF9IjQt
 EzmIuGNDOR1bP+lM+43TAQOX86PCdk5Po1T+wAGquEqc1SuZtlfXsMZ1CJwg6cZG05M9
 oXvw==
X-Gm-Message-State: AJIora9OrgZiMxv/QnOnPl5vzqB+/+adIzYbuwF390y85pMU3jwKO8gu
 2XrZECeTZ+DdPLcytIXsyRmgn/dBQH5lAsAVxWUFUw==
X-Received: by 2002:a25:d307:0:b0:670:80fd:85c4 with SMTP id
 e7-20020a25d307000000b0067080fd85c4mr8478815ybf.67.1658747278158; Mon, 25 Jul
 2022 04:07:58 -0700 (PDT)
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
In-Reply-To: <CAFEAcA8wfEfxZh4NFpbDAsB=Rz=9-UcafOWbEtGkJ1WGZs71WQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2022 12:07:18 +0100
Message-ID: <CAFEAcA9GdtaUmn_Ft3uYobfwNX0wkg2tDUTC2uS2erim32W8YA@mail.gmail.com>
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
X-TUID: dvIIrzlXh6Te

On Thu, 21 Jul 2022 at 21:36, Peter Maydell <peter.maydell@linaro.org> wrote:
> Now I understand the cause of the bug I'll think about how to
> best fix it, but I won't get to that until next week.

I've now posted a patch which I think should fix it:
https://patchew.org/QEMU/20220725110035.1273441-1-peter.maydell@linaro.org/

-- PMM
