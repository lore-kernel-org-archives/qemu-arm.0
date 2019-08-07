Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6711299wrv;
        Wed, 7 Aug 2019 08:48:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqys4gTr+kKmXVbRVlsi6DSHs5WIWq0bYbjs/hvLeggd59u7tfI28MGB3fICTDUN9nP49Bq6
X-Received: by 2002:a50:900d:: with SMTP id b13mr10538094eda.289.1565192937401;
        Wed, 07 Aug 2019 08:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565192937; cv=none;
        d=google.com; s=arc-20160816;
        b=O6VawdS3EsPCnTvvaFkYMuYD0q+lZlCETBjUV4zRJEBzjc7Zov3Q0M6cVW0OXJrMVG
         KUyS6SGqk2/QYHolozvr5aBQokOoq4MeUet1PnBwZ/8317gYVkZ5YIBVve/kz8bD3Dqx
         H0z1Ja5dbpCtstoDz1gTo0xscyEqmcbnaQPvBBAGczzkdlc2gym60cMmqFMyp7Zhx4rS
         ZJfsHSHRlbvfZNJ7P7G92j8hHzSJece6rMNkFKXbn2HFJgA3C1haptFvFkueovK6M1uq
         piajEAxCnAXNqR6Dtx3IBO4brF87WSOAGRw50e0JOhZ4rbI6WtixgeOLKyI1vAuK5mal
         bsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=FWMr6neQ5AMhU9BiMZ0df4YPu7SSIXi7Ssstbu8wM4I=;
        b=Srp1UJ/KaRdGkaACz1T0lCKgG+cZUJlCuu7WT7kd0hBXBcHfDukDFnKCQ6Y3WSygA4
         nFs7ehAuFDKG9Gw9OHK+GaSZp4+S44B4pVh2Wd7PwhsJPj1NSdad8G50IEsUfDOzMQEC
         3glO8B14TFCgVQ1VeyjpphH54tzDHwpXNtx4AgXwLT0OoJYDm9e22pJQRaZG+gJXgL0L
         k6jM868UCIbJ4RRn+fGtH+eT+xDp62KsJa4RTZ5f9lZlz47wKzwAkLoPM48itRujLeUa
         /NuzZu6rDsL1Fs77kAMSwNimSykldv1TEkB6aCRPpMfuMaNSRJakBRv/Ztiivr/iPc4G
         bamQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IK+EC8rx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h24si29704657ejq.177.2019.08.07.08.48.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:48:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IK+EC8rx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvOBM-0007WE-Fj
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59102)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOB2-0007R3-RD
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOB1-0008KQ-TB
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:48:36 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33257)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOB1-0008K4-MX
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:48:35 -0400
Received: by mail-pl1-x644.google.com with SMTP id c14so41338344plo.0
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FWMr6neQ5AMhU9BiMZ0df4YPu7SSIXi7Ssstbu8wM4I=;
 b=IK+EC8rxSLj6GnhhMqmFSBOePtP4VGVXguG7qL48rfGiQnzRq4ct9g7jz1KwQ+ZFNw
 CTnE50cpiGbWhKHIInyj7AxKpvzUGkGykuEnQgWG2IUbKeaN+ems8FkmPgx8Ex4+kFD1
 tXsycNBHqgk3W/q+TgXl55usAJSoLowUlCU2OM5Tcpx4HYLD9DkQT0JoOSsPf+/CYexH
 EOSw7eT9wff9WPsOs2RP8iAVYrjEOazEnOEHMSWcdNjcEyyqbuRCDO4fapIWJH9RH7NM
 y7JsyIccajdyh5IN5l8M/xTx3F+rCeNU03PdY3Adi3YNmEwkoqo6YHXnsghfPoYxwQT2
 GBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FWMr6neQ5AMhU9BiMZ0df4YPu7SSIXi7Ssstbu8wM4I=;
 b=Nls65ZzPO7nPW1hfoOxDv+xJkCHErbfR7nkH8otrisnFE2VXMOVgTfHPQ/onfM2mLe
 G1w4c4+5BEc6FvlrXBwfxh0VszsHL3iGJxMORIkzenba5meTMotlq/T4zEf6BKeabe6n
 9jiaMuMGj/x1T9kzXQumBVwAuOr1SsGfI5nZto7J2DXaTMWuvZexdc3wVfpTUlli/zfw
 7o62xVuVfFkBqrzqmkAPle0AHxe22HSBG2KYJEpzWOlo1KjCI9Jg5SyAAXSRJT2HcoTX
 Eu4H/WcU+j/8FUn36g6Mdyon+EmRRjaMOYVe6gfzKGgUEhP6Spcwc8jhgFT0CUd4gKAg
 spHA==
X-Gm-Message-State: APjAAAVq3G+TXHcVH4NxxdJAs4Znn0OAkqlPoCtrG2ux+T+ptYvrwOZ+
 ITcZkwl9KhkZC/nOSkeF/jIAfQ==
X-Received: by 2002:a62:5253:: with SMTP id g80mr9900905pfb.179.1565192914835; 
 Wed, 07 Aug 2019 08:48:34 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f14sm10154655pgu.8.2019.08.07.08.48.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:48:33 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166644883.25395@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bc5dbc6e-c690-35fa-8090-2b695891a02a@linaro.org>
Date: Wed, 7 Aug 2019 08:48:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166644883.25395@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 14/26] exec: Hard code size
 with MO_{8|16|32|64}
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, imammedo@redhat.com, sagark@eecs.berkeley.edu,
 david@redhat.com, jasowang@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, keith.busch@intel.com,
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, pbonzini@redhat.com,
 kraxel@redhat.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com, marex@denx.de,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 proljc@gmail.com, qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz,
 deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, mreitz@redhat.com, hpoussin@reactos.org,
 joel@jms.id.au, anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 rth@twiddle.net, philmd@redhat.com, green@moxielogic.com, atar4qemu@gmail.com,
 antonynpavlov@gmail.com, jiri@resnulli.us, ehabkost@redhat.com,
 minyard@acm.org, sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, yuval.shaia@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, shorne@gmail.com,
 sundeep.lkml@gmail.com, jsnow@redhat.com, david@gibson.dropbear.id.au,
 kwolf@redhat.com, crwulff@gmail.com, qemu-riscv@nongnu.org,
 xiaoguangrong.eric@gmail.com, i.mitsyanko@gmail.com, lersek@redhat.com,
 cohuck@redhat.com, alex.williamson@redhat.com, Andrew.Baumann@microsoft.com,
 jcd@tribudubois.net, andrew@aj.id.au, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de, jan.kiszka@web.de,
 stefanb@linux.ibm.com, andrew.smirnov@gmail.com, aurelien@aurel32.net,
 clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OeWPnV8T8I98

On 8/7/19 1:30 AM, tony.nguyen@bt.com wrote:
> Temporarily no-op size_memop was introduced to aid the conversion of
> memory_region_dispatch_{read|write} operand "unsigned size" into
> "MemOp op".
> 
> Now size_memop is implemented, again hard coded size but with
> MO_{8|16|32|64}. This is more expressive and avoid size_memop calls.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  memory_ldst.inc.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


