Received: by 10.28.173.206 with SMTP id w197csp911951wme;
        Thu, 11 Jan 2018 11:24:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBotFcIabdLNN5EwroX6rl6y3oXp/VL5Gp9s9u7KUX/6VHf/+zZvPSKk9hWiUrpk+uXc40gs3
X-Received: by 10.129.179.201 with SMTP id r192mr20602190ywh.270.1515698642411;
        Thu, 11 Jan 2018 11:24:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515698642; cv=none;
        d=google.com; s=arc-20160816;
        b=IOI9Tvlk0ujPR8Mzj0SWl/rzjK8re4XR+ZrZvBKUnMqcr7Q5YCmo+yQC+VFB9sZifh
         BxVXufOo028FCR43FQ0kuzIcQJaSG0RhkdE8bNEg9xQcNKxD6imRalK6+s7qg01K03/O
         dAidkjri5pffPu2Cmk0xr0pnrLGFZHWSQipAyB+zpbYtL6CW67slqPjGxJ86dpntyKWn
         ZOoK4c9OSfFQRT+7EySyEpOAB7h40s+3wniLtfpnuKmBl8RIO+Ije8/3pwyaQJpqVsuf
         4rtBDCmHsHTfH3BdTl1IJrj/r/Vc9YDeALjfg6VmK1IWWnjcMKOYyREImKJnLdYxGnaY
         3dVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=dHUwh9JwcnlYqIt9QvtuXhiyJ4KOKp0OA9y+frYBASg=;
        b=IhPhsHQofRMTUFQHroEJqvRI0BLL4yOsMs1N+NlwBda4yt+lYGKDWaB0kypuTCEXv3
         shEVeXccwwV/NnRGAKjeNCwVO+Bxjg/VP88BwK5xdX0qCOWRKTovZrw9xG9zdfQQE44k
         hJZfERCwR/wHVfqD9lOKlVLRJAn7YdNHV1kpdDHr6+fMDg08Yo0OWPYDBCJvR7F4g2GG
         7rhbh5ALFZOS5BmirVbJEpugCGXmet7KtkgGZBqTkHJ/Tt3f3yTYxjg9f4faN4qWc34s
         1+T9muYr9SAE41Rn/PzBKvA9X9OnF5uO+KuCZLB1Xgh0qcPyJzTqzlOEWZwsss9QROyS
         khQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E2Xyy55Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 126si4238498ybu.654.2018.01.11.11.24.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 11:24:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E2Xyy55Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZiSH-0007Cr-QY
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 14:24:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiSA-0007CK-RD
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:23:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiS8-0005u1-1b
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:23:54 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:41450)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eZiS7-0005tV-Pz
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:23:51 -0500
Received: by mail-pg0-x244.google.com with SMTP id 136so2286465pgd.8
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 11:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dHUwh9JwcnlYqIt9QvtuXhiyJ4KOKp0OA9y+frYBASg=;
	b=E2Xyy55QUODZ5VyvjwT2I8nWij+zLQoo3Gwi7+YG6BGh2qcYqfZXLQLuy7ftHeWt5t
	vvo8FEj5BRYd5RFw7pzTxOH4xYeI29MqVqdwESp7Pu9D0McA5fPNndrisqbAtbKErglr
	eNVE8GC2sfnbIiqVqptYvFwyobcXK65YYu8i8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dHUwh9JwcnlYqIt9QvtuXhiyJ4KOKp0OA9y+frYBASg=;
	b=ZmmkN9iD8ca36XXebFFm3m/+TWTK09SJqp0XI2cxfKAoRaCpFAn6RvBZgifEf69cO7
	ctk9LF6cYDb3giU1TPQ5eh7YwbISHXO6IQvxtqz+PHLchqszn7qg3OdRLdhVcSTLhiUq
	6Q+HyqiDTvIagTG7BKl0qScgTxIqZ1C3RYOmAp1bJmcTuv2VurYFOhe/oFbOtfzDK7Kr
	76QB1JYm+PeqrOYhnQCok3eiVCEEE0eroDSOPoutzJG1kJzgge1TaojbNO57eoFx37sb
	uQKX1ofFPeaQSikUJrvCsvfplodJPeaUfDaWOBlgeJarn1GAqRHMrk+WV+EzLWFW/YEm
	+9vQ==
X-Gm-Message-State: AKGB3mKBDUtBLIpf7O8TwDEjA8Xe9AdvhV3ppib0FjQiTwRfpykZGb0o
	qrKB1lb13PrC5VEIxoeXHBMJ11P+LcA=
X-Received: by 10.84.240.12 with SMTP id y12mr23151607plk.382.1515698630297;
	Thu, 11 Jan 2018 11:23:50 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-183-164.tukw.qwest.net.
	[97.113.183.164]) by smtp.gmail.com with ESMTPSA id
	e7sm44919524pfj.44.2018.01.11.11.23.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 11:23:49 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<CAFEAcA9Qnj0G03x72BFLAYmodeBMDB=t3pz4JxUj0HvrbhkuGA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f82e02e3-40dd-8e74-6fe5-3205cdd42758@linaro.org>
Date: Thu, 11 Jan 2018 11:23:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Qnj0G03x72BFLAYmodeBMDB=t3pz4JxUj0HvrbhkuGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-arm] [RFC 00/23] target/arm: decode generator and initial
 sve patches
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bNQfv3zoEQOm

On 01/11/2018 09:56 AM, Peter Maydell wrote:
> On 18 December 2017 at 17:45, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> The most important part here, for review, is the first patch.
>>
>> I add a code generator, writen in python, which takes an input file
>> that describes the opcode bits and field bits of the instructions,
>> and outputs a function that does all of the decoding.
>>
>> The subsequent patches begin to add SVE support and also demonstrate
>> how I envision how both the decoder and the tcg host vector support
>> are to be used.  Thus, review of the direction would be appreciated
>> before there are another 100 patches along the same style.
> 
> This doesn't apply to master -- do you have an example of
> what the generated code comes out like?

That's why I gave you a link to a buildable branch on Tuesday.

But here's are some snippets from what's current in my tree.

Note that I play games with the decode and translation such that e.g. SETFFR ->
PTRUE p16, all; RDFFR pd -> ORR pd, p16, p16, p16.  That's what you'll be
seeing in the last dozen lines.  But I also chose that snippet because it shows
the nesting when instruction subsets need to decode more bits.


r~


    switch ((insn >> 24) & 0xff) {
    case 0x4:
        /* 00000100 ........ ........ ........ */
        switch (insn & 0x0020e000) {
        case 0x00000000:
            /* 00000100 ..0..... 000..... ........ */
            switch ((insn >> 16) & 0x1f) {
            case 0x0:
                /* 00000100 ..000000 000..... ........ */
                extract_rdn_pg_rm_esz(&u.f_rprr_esz, insn);
                trans_ADD_zpzz(ctx, &u.f_rprr_esz, insn);
                return true;
            case 0x1:
                /* 00000100 ..000001 000..... ........ */
                extract_rdn_pg_rm_esz(&u.f_rprr_esz, insn);
                trans_SUB_zpzz(ctx, &u.f_rprr_esz, insn);
                return true;
            case 0x3:
                /* 00000100 ..000011 000..... ........ */
                extract_rdm_pg_rn_esz(&u.f_rprr_esz, insn);
                trans_SUB_zpzz(ctx, &u.f_rprr_esz, insn);
                return true;
            case 0x8:
                /* 00000100 ..001000 000..... ........ */
                extract_rdn_pg_rm_esz(&u.f_rprr_esz, insn);
                trans_SMAX_zpzz(ctx, &u.f_rprr_esz, insn);
                return true;

...

            case 0x00100000:
                /* 00100101 ..01.... 11...... ...0.... */
                switch ((insn >> 17) & 0x7) {
                case 0x0:
                    /* 00100101 ..01000. 11...... ...0.... */
                    extract_Fmt_42(&u.f_22, insn);
                    switch (insn & 0x00c1020f) {
                    case 0x00400000:
                        /* 00100101 01010000 11....0. ...00000 */
                        trans_PTEST(ctx, &u.f_22, insn);
                        return true;
                    }
                    return false;
                case 0x4:
                    /* 00100101 ..01100. 11...... ...0.... */
                    switch ((insn >> 10) & 0xf) {
                    case 0x0:
                        /* 00100101 ..01100. 110000.. ...0.... */
                        extract_pd_pn(&u.f_rr_esz, insn);
                        switch (insn & 0x00c10200) {
                        case 0x00400000:
                            /* 00100101 01011000 1100000. ...0.... */
                            trans_PFIRST(ctx, &u.f_rr_esz, insn);
                            return true;
                        }
                        return false;
                    case 0x1:
                        /* 00100101 ..01100. 110001.. ...0.... */
                        extract_pd_pn_esz(&u.f_rr_esz, insn);
                        switch (insn & 0x00010200) {
                        case 0x00010000:
                            /* 00100101 ..011001 1100010. ...0.... */
                            trans_PNEXT(ctx, &u.f_rr_esz, insn);
                            return true;
                        }
                        return false;
                    case 0x8:
                        /* 00100101 ..01100. 111000.. ...0.... */
                        extract_Fmt_43(&u.f_ptrue, insn);
                        trans_PTRUE(ctx, &u.f_ptrue, insn);
                        return true;
                    case 0x9:
                        /* 00100101 ..01100. 111001.. ...0.... */
                        extract_Fmt_45(&u.f_ptrue, insn);
                        switch (insn & 0x00c103e0) {
                        case 0x00000000:
                            /* 00100101 00011000 11100100 0000.... */
                            trans_PTRUE(ctx, &u.f_ptrue, insn);
                            return true;
                        }
                        return false;
                    case 0xc:
                        /* 00100101 ..01100. 111100.. ...0.... */
                        switch (insn & 0x00810200) {
                        case 0x00000000:
                            /* 00100101 0.011000 1111000. ...0.... */
                            extract_Fmt_46(&u.f_rprr_s, insn);
                            trans_ORR_pppp(ctx, &u.f_rprr_s, insn);
                            return true;
                        case 0x00010000:
                            /* 00100101 0.011001 1111000. ...0.... */
                            extract_Fmt_47(&u.f_rprr_s, insn);
                            switch (insn & 0x004001e0) {
                            case 0x00000000:
                                /* 00100101 00011001 11110000 0000.... */
                                trans_ORR_pppp(ctx, &u.f_rprr_s, insn);
                                return true;
                            }
                            return false;
                        }
                        return false;
                    }
                    return false;
                }
                return false;

