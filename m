Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp304440ejq;
        Tue, 16 May 2023 03:13:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4k/+mIqbzeGfABVWCAcSTQWyA1dUATY4oJADMbPTYtaHnJJg/hvMr3eHi7Zefq+zxL/OjA
X-Received: by 2002:a05:6214:27c9:b0:61b:3557:a695 with SMTP id ge9-20020a05621427c900b0061b3557a695mr52806948qvb.45.1684231995503;
        Tue, 16 May 2023 03:13:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684231995; cv=none;
        d=google.com; s=arc-20160816;
        b=Gn0CsJkwmcwH/h//afc0ZyR9C1J7m9Rxx8tR/p0Lm0211Ti4g7OiNv11INaXhFB23h
         us4LqoEoCl0NwB+8ZxMGNDw7uXpRxAyFK8d+YZDFgAAbw9Dd9eKZ1woTLicx3tXh6PVy
         6YqjKf73z1kwvgSUVSD1VLjQ+QgILmMB3aVmrhDNGyeK8nQNORkViorxVRsnzxbcaK9Z
         PUfVnSbS8klpv4FZTwsdtR6rbiaqD3JHK2l74AGyjEvfy40s9KF3HrZ3IvhLCd16d4so
         HLFPNhAqDhu8pbu8WjZeY/TE79iiX2W1yhkm/J5/X4xnk4FLdqL0c2PYuiM+rskRcKcq
         jf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DQizkdnZsAOG6QlIDBtEu548HfkhlFmfojjKz3BfyMk=;
        b=S4M+Mcoeq7UCOwfwcwTZZuV3Lqo04NoKRYZAw202XlaDvpaI562mTLXQMKlTjpXrHD
         CKVpkgZ+5sIKGfQhi2MxI/sKhIzuAmowvFRUwxYKO98q42L1odDXMGtQCk/Mo46hOskk
         V1NpsAQfxZ7jjWgn2+AbLa1EJ2WLiQghyLmM/DunTIi66Y4rsdbspNx2Hqfj7EPk4wak
         qDM+NTNkecpXiMjxVob3mqUqJgEeEXjLP0MW/3EPJXMMrVp1M0I26Eif/u3FHlQ15D+y
         rkLXkBEwhnRZYQqPyHD8N89RudiZ0LZcRps3AevmSzXxSbDY20L4tohejxan1LCLz/y/
         s2PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cUmC6SiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11-20020ac85f0b000000b003f364fdc68bsi10445389qta.404.2023.05.16.03.13.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 03:13:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cUmC6SiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyrfz-00081O-Ru; Tue, 16 May 2023 06:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrfr-0007zy-JY
 for qemu-arm@nongnu.org; Tue, 16 May 2023 06:12:56 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrfp-0005Pl-4p
 for qemu-arm@nongnu.org; Tue, 16 May 2023 06:12:55 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc570b4a3so25023577a12.1
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684231971; x=1686823971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DQizkdnZsAOG6QlIDBtEu548HfkhlFmfojjKz3BfyMk=;
 b=cUmC6SiXzqyfRqX408w9CnGqH69Vnpc22OQlDMKNBdyVn5EswMXVVi8ivpR9bArJPq
 /HygJQz3U4+WyPKXSn0I5zPDIO2ipDoCzx3zeHLQD4lSEGUVw/gZ2DyvtC0EjKE1FU7A
 Jaw9oHnGjWVJ42qbkfo+KjJmKq7ReGoWaYymM77VakZqUjc+JjfVFTEBZcEsxOsyL4KV
 PcF6kdUyehuVUDfCmohBtNwBIA5uhef/Y/MvuCHGgXIA0z5NJepLGXsqnraQMgmyCXl9
 tllgbJUgCFdr6bYaIkzeUtSnRnyzX54+Y8aFGcA14V8PMTbdLPVBMjOmIwLOswomU0Km
 L7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684231971; x=1686823971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DQizkdnZsAOG6QlIDBtEu548HfkhlFmfojjKz3BfyMk=;
 b=TpGqm0O5inGCYURKi474lnc9hq3e29nrR807tkU4lvqqoqAKlrZhcWrDpGx0jfwDSl
 TTkT4L4IGHzbGn6i3QZi2ZEx2RJieD31grqYQeb2qzyXv4TcAIfvT0fcqYfMRhSQOedw
 wD8EliOrH3WdNJFpBcPvAdtKBVMVvYXj88KC24+n2Lm8kaRXuAqscMqDzE85M1YQzEpY
 lWeaCg5YJLjNIkm7b6PsyPqf8SFYQLv19o9BfdDa8Frv+2Z/Jng9o2LdV40QFjNVf84a
 JtOzgcx2fgvagxHjJXqXgyNf1QvLnqogC8/y01O8zm2+W3Lf7IkSR9QZXEXc1nmqzMcp
 2Qww==
X-Gm-Message-State: AC+VfDwP7X3joep3wkx1jRrF+m2kV19xPly7o7HvqrCNXpnERn3yyYyd
 HaBxt38v4l9CeECZxS2kodcjYHSq85XeRUnD2hTAYQ==
X-Received: by 2002:a05:6402:216:b0:50b:bfee:ea26 with SMTP id
 t22-20020a056402021600b0050bbfeeea26mr25642561edv.35.1684231971295; Tue, 16
 May 2023 03:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-46-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 11:12:40 +0100
Message-ID: <CAFEAcA-MuLtne125bOSRonnM29kwYxbYi0yjEcD92HXm1O6JTw@mail.gmail.com>
Subject: Re: [PATCH v5 45/54] tcg/ppc: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: zxX8RhF1X8En

On Mon, 15 May 2023 at 15:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
