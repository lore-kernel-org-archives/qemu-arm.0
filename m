Received: by 10.28.71.155 with SMTP id m27csp653783wmi;
        Thu, 22 Mar 2018 11:01:46 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsr4MlECbyu1Lrl7giRY55pC7w+CJUfmKV+gzb5WFGA/DqMCImjixJFcOSUIh/0Mphvfsuv
X-Received: by 10.55.82.130 with SMTP id g124mr36654846qkb.313.1521741706788;
        Thu, 22 Mar 2018 11:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521741706; cv=none;
        d=google.com; s=arc-20160816;
        b=sblyLBRouOqjpxc67jHnSsbL/K9RTT9kI2dxhfCcm5ylz8zq4ZxqUtgO1DvFMdI+i+
         i8u3T5/kcVoLajSBFCtefcFGqOSNVTVXJJJQVFiZFdhBqSMWwoTLY87VSAsJ+vmUUjST
         tJk3sSJ9UlNdYUhZkvMBHnWQ+WxQX/jZ1ZcHLa5y8X/u9zepGx8+nkjw8/gJ0jmZPxas
         pXNDWNVFolIKHtw2EdSLLj9nn/QVX6wiallbNEL1KRAZPa/xKndvoO7p+QcljB2EQz0p
         iMMS+N7gR8qontL8bvCkVzn67RuSXLYpI3JFXaNHWm1X9XMuKTzZ7osYorQehy7R2HU+
         mmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=iQcvNunmzOq3ivGppgVV/z4QN9zJhqdYAItlCRAMhsk=;
        b=c0BEJZkqOLAVGwrmEeL5LgBD/EbWIDvY/+STk+T9mriow0aLLnHDDzHdnYxbGpL6w6
         +YxssPldGSOJxSr86ajTLJhtX0KSGruVQlCG26FY5B8ejKlWYgdhZLOAezDUCDVSQxV1
         Pau8oKXqo64K/UI/HNzD90hK/ysiKpEWB7c2fcjbmAFz/tFXfHv+vg+2Q9sPLt1dUjgh
         SdzcjHR8sSXQhY0t7ERerIdvzm9j6P1MLRZKEOtrPVevkc288mgm8MGLbUb6RrnaKlXz
         h3fcGES8joBIak1+1e+sDGoCCFPamz5ts/F8a/fAAlJRRCS0OEFG6F5XNZSl+KG2RRki
         WWaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bNm2eEkH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u19si2618033qke.335.2018.03.22.11.01.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 11:01:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bNm2eEkH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez4X2-0006T1-VD
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 14:01:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez4WA-00060L-O2
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 14:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez4WA-0004zx-1q
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 14:00:50 -0400
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:36514)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ez4W9-0004zf-Ru
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 14:00:49 -0400
Received: by mail-ot0-x235.google.com with SMTP id 108-v6so10435011otv.3
	for <qemu-arm@nongnu.org>; Thu, 22 Mar 2018 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iQcvNunmzOq3ivGppgVV/z4QN9zJhqdYAItlCRAMhsk=;
	b=bNm2eEkH83SKV5VCb87XhToE8WnUAestSsSr0JVBkChc57+Td9Kh4OMon5f+kfVzjd
	nNxJSOlpUnmtG1eJXUf0So3YzY8mJj3sXivqZfWzuncPc2kVDiJwPQppPGPoasFo3zzG
	cq8Jf78rL/CiHp5+HhN3Sgf6mfFv8OZ4gxcPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iQcvNunmzOq3ivGppgVV/z4QN9zJhqdYAItlCRAMhsk=;
	b=b01phkruDztPD6QcjyoGKOrLcJNNc/+dZsHi1xV+C8q9s1GGWiNEk9sptRBPqB3xM1
	Y9bj/D1wc7yhHXQtiA5thGuU4wmgxR439ne5XUCDKf6Xbc7OBJrco0SFmZNL4wT6OOd5
	1e2WSSh4ffbHM0zP4og7R/yTvvifN5eg7y5odfTJ9iua3obxM0gdUoe/qd8m+EHCQsFy
	cFx0mtPg9VX3/80BZ6zwTbluBBqOaNLy0XjIO5GXlvcxOb0zrTXgonHqSa+qNLAKk3p1
	4urkBU5WRiZpPLenT/D5thP1CHxMgGv5Wdat+vEh4qU4d4BMtnU6x5M1oQj1HK9dzRd8
	NQSw==
X-Gm-Message-State: AElRT7FL75+fIQOXalooqMkt6hkhzpL7bpvtzJ2LwbnUapT5PMz/bVJ9
	TsApdXgxoiAVnfm4SZXkPfs1w+331f9KCmQ3c1xU9Q==
X-Received: by 2002:a9d:285d:: with SMTP id
	h29-v6mr5980147otd.205.1521741648758; 
	Thu, 22 Mar 2018 11:00:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 11:00:28
	-0700 (PDT)
In-Reply-To: <152174145840.240.3926671265619235661@71c20359a636>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<152174145840.240.3926671265619235661@71c20359a636>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 18:00:28 +0000
Message-ID: <CAFEAcA_Uxhrh2L+FghG7y2r7n36rfo41jKw9vdGZYo32nk28cg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/4] coccinelle: re-run scripts
 from scripts/coccinelle
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Alberto Garcia <berto@igalia.com>,
	Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PAHP2X/xEE3B

On 22 March 2018 at 17:57,  <no-reply@patchew.org> wrote:
> Checking PATCH 4/4: Remove unnecessary variables for function return value...
> ERROR: return is not a function, parentheses are not required
> #251: FILE: target/mips/dsp_helper.c:3281:
> +    return (temp[1] << 63) | (temp[0] >> 1);

This looks like a bug in checkpatch. I guess to fix it you'd need
to make checkpatch count opening and closing parens in the line
to see if it goes to 0 somewhere other than just before the ';'...

thanks
-- PMM
