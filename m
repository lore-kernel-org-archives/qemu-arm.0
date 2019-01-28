Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3151340wrt;
        Mon, 28 Jan 2019 03:12:24 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5cSYtVMaszSDJ5E1p5EsWHC158CXAHrUjFaTjpL78ZM5MUZNVYJW9WwcFrbat9nLJBbDns
X-Received: by 2002:adf:a58a:: with SMTP id g10mr21185219wrc.3.1548673944108;
        Mon, 28 Jan 2019 03:12:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548673944; cv=none;
        d=google.com; s=arc-20160816;
        b=Xxj7MlL0mAuC6uSrDoxZh+gtXS0nVOuPs/ovF8iQIcsKzb+AFoQlwDfg+Ok08OhDsM
         KVKrFvNv9sYCZ6UsGWBGU7orRHV9M3dblqIVObkoZVByUf6mXlW8ej17//QaEjqDOZ2w
         nPKsS/oiELc8js5U8WIte1Q+wDhxyH2UZdgPG8tAPOB6IDP4HEgOEg/17MyTWPXV1o2S
         TaTW+CfzusztQz9EW+TDfXUbFpAqm/41kZ4MXodUs9CqVEpuo+/YjmLReSJjEZJ0rcC8
         Q354d1yQM2HEwBZBrSjm7Oc0bGMV1DbVmiue+DzD4yofZ21w5pkJKyQ+7XNuBDxMdTsB
         79zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4nssW+hrNl+xP3hYd4NyBBiMKGSnP96oClcE/JvfmgM=;
        b=VSD2ZjmQY7MWAxf+pyny6QZZZ2/t7F+tZVPWRubrEkTlGIiUslmpfs6d/YWes2hTEa
         W2h0lAKdGy2C3x7nrVOigyKjNB/ArbZWUQ1uBIxsSwGrvYWpu5pKab9raqbU3U0d6dEL
         jvBFKqpzTFqVHfLeAko/48C37DVf2jaG+wMdmvYk7MK/2JfsnuTDBjKvocsAfRLUNqzK
         ezXP2vIlXnE0XTZx9ubQYf38OsZgOBuSWjdN3OYcaDaj1z6gAv906e0kU/bjs5Ne6l2o
         0Wod50l1BHuS4YsCYv5m0H25nj4OlOdvt9/yaAZgt1Em7Sc6vnDX9g0rzksbLHTo9DLP
         XTIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g6duZhLQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si80897507wrc.258.2019.01.28.03.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:12:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g6duZhLQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4pz-0007VF-4D
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:12:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4nX-00068K-Dn
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 06:09:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go4nW-0005az-Pf
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 06:09:51 -0500
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142]:40935)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1go4nU-0005X7-8O; Mon, 28 Jan 2019 06:09:49 -0500
Received: by mail-it1-x142.google.com with SMTP id h193so18722491ita.5;
	Mon, 28 Jan 2019 03:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4nssW+hrNl+xP3hYd4NyBBiMKGSnP96oClcE/JvfmgM=;
	b=g6duZhLQYFeVKWmKNEt8C73oF5gjEq4A8ks7bfIxsTCkdvCZeahCDxy/Ql9m5nR9xP
	GY0wU3qHZH6Nc2j8+TOCuZiaRi2AVM0neklLrF8mwwnr1bgUl/YCYAGgNQuCgEPk/OXW
	9oVjY0oa9XHxbk8Z4TSYYtjbwv4Q8Ii1WySm6wtVKqZzVAyhK8Qwv7C0koETaPEHWlbh
	4sAQW3C7cmgbr4gPNIU8VnNquHxWLCAo+vxpDzva2Y93mEixTbdmpT5+Q3QwaH3s0jXM
	Tky66ouKigFNFcbuSaDyGikRd2MGuYw9leaAbUrji+8vUmpH7ZFdGsC2WjjAYrdFAFtF
	SRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4nssW+hrNl+xP3hYd4NyBBiMKGSnP96oClcE/JvfmgM=;
	b=K74cINlQZDJh0e5uN3YSuFydxM8EvcJ7bpsUWyPwbNdOtVMgKbkyNARdryR1g6tXiM
	WaTex0wZBfhpE2BXPXla3eX8nv8TEyE8WHXsZKcXdtskRqqA6VSSD3kdlTTF+rDbVbQ/
	WNWBoF63xrzP3tiSYqHyN+1yfh8pj66L6qXPgzcSdN8X5dQuEFeuKtunB3WYQS1QLirk
	cdq5SKrLKp+Qb8XDEDxWX2pk6Z2n2LIo+Tc87Oesz6EuC2caX9jPkADAAlnzjI1E4JqL
	ik84AfRCuK45SULgMV0hJMnXftUqC2lEPPvJhArOMm9bteuYOjZ0rwqva2Bxkh3icGNN
	Zj0g==
X-Gm-Message-State: AJcUukfMVkzN/Rf+BDIsmK0iH6exbAQrdpvh6ISPtzpu/xPRCBcn/T4F
	6bKcjOTidpdZrigBBBnw8AyPLjcQ/lhk8Iufx1o=
X-Received: by 2002:a24:fa04:: with SMTP id v4mr8581871ith.175.1548673769907; 
	Mon, 28 Jan 2019 03:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20190125182626.9221-1-peter.maydell@linaro.org>
	<20190125182626.9221-2-peter.maydell@linaro.org>
In-Reply-To: <20190125182626.9221-2-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 28 Jan 2019 12:09:39 +0100
Message-ID: <CABoDooPvj56h=3kkT80afx6FGGnS8fNqWNxouhX8xSBQ79pf7w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::142
Subject: Re: [Qemu-devel] [PATCH 1/7] target/arm/translate-a64: Don't
 underdecode system instructions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E5pOHFt1izYZ

On Fri, Jan 25, 2019 at 7:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The "system instructions" and "system register move" subcategories
> of "branches, exception generating and system instructions" for A64
> only apply if bits [23:22] are zero; other values are currently
> unallocated. Correctly UNDEF these unallocated encodings.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/translate-a64.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 4d28a27c3bd..e6df303e321 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -2144,7 +2144,11 @@ static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
>          break;
>      case 0x6a: /* Exception generation / System */
>          if (insn & (1 << 24)) {
> -            disas_system(s, insn);
> +            if (extract32(insn, 22, 2) == 0) {
> +                disas_system(s, insn);
> +            } else {
> +                unallocated_encoding(s);
> +            }
>          } else {
>              disas_exc(s, insn);
>          }
> --
> 2.20.1
>
