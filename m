Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1445001njb;
        Fri, 9 May 2025 17:21:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYWSCtpaw8PF6ZzfLZtPk/V7uWfaCxFz13Pr2psSGuBtDuDAez/I8UNdW7tdLotubq+nfRHjC0cfX/Eg==@linaro.org
X-Google-Smtp-Source: AGHT+IERgfKxAjoCYBi+T3qVGUBYEk5N3RrEtdZelQX196HFt85IJbvGQhKxz1yz5wHQWcjfk8i1
X-Received: by 2002:ac8:5889:0:b0:476:8e3e:2da4 with SMTP id d75a77b69052e-494527d5104mr80217201cf.38.1746836496122;
        Fri, 09 May 2025 17:21:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746836496; cv=none;
        d=google.com; s=arc-20240605;
        b=aNfjlgT0sa4VbVfiR0zXsWphhvgoG28uxm+jgbds44DAd5jbE8m90v3AmEYk9+P2mn
         +2ISLslKi8cU/3cM6N+e1Aht3OabVfgStlSceHA/yYYto45SoxMkep8UwDp5idq3m69D
         oqgTNgIpFO6JSrPvSjdHDXDd+keotx4Hc4nFN+8dC43NENeKBgv7gfdhkQaA/EeNXEj4
         IZPBRVjD2rCDuP0RrUKW1xvNA7rJ0gABaNj/guwuCzONA4A65eSi6Azsrm7d9OHQp6SI
         mLZQXDdP1s0svWzf3jOmiXkcGCDsxbmOyLdi6Om3IUfZcTjRcuS9cTevYvzuwxXqrkIX
         MM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:domainkey-signature:dkim-signature;
        bh=qxg6PvEU9gT+6grx/GA843Oi7XlUmz4T0APN2cFwIKs=;
        fh=fZho1DREBuo93XudlTDgp2dD8YHE1roOEV+ColyC538=;
        b=dPhsdnbWNeTQresMNXyaswjZkz60WiuCMVgwXPtjuL+Z+d5jLQZn0cOX5AsjCMfyTx
         mwKSI2MjNGlbETk6vxVXu/iXEQtrYK718SwvClnMoJzMs9WJqmLDQ9HTd6SsnagupX6e
         vFQMG+paos2Dj/CSbW2eUhGRO8fChlrHrJnsf+qfztoedOXyH8pSmRH2z3YuCnxlN8cl
         VpE3qO01XdTxoRITnGx0r3iear5dNe2c/lHQtf3Zrzsc1GelanxbBh1S90pcZDmMWkAz
         rQhQ2Y/UTnT9NSnsRfPb84QM+FBW10MlzXrIq1vWhWwvS122xtREEQTVqZur6KXYhwu8
         /BdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@comstyle.com header.s=default header.b=XOZ+NeHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=comstyle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452479f1csi33384301cf.150.2025.05.09.17.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 17:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@comstyle.com header.s=default header.b=XOZ+NeHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=comstyle.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDXy1-0004nq-SJ; Fri, 09 May 2025 20:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1uDXxx-0004nU-Hu
 for qemu-arm@nongnu.org; Fri, 09 May 2025 20:21:23 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1uDXxt-00071Y-8r
 for qemu-arm@nongnu.org; Fri, 09 May 2025 20:21:20 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4ZvRNv6mtvz8PbP;
 Fri,  9 May 2025 20:21:03 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=comstyle.com; h=
 content-type:message-id:date:mime-version:subject:to:cc
 :references:from:in-reply-to; s=default; bh=RZX6kB5/LuF9FEMddt3W
 49pXkcW6ZztkqBZPWG+z30E=; b=XOZ+NeHKasqglKUHKrqGrZaaeFjXh2uRaPIF
 YOdtCXRVGwLsAOU6pPSx+W16Qkel5EbY9j/QuSEsXEyhb+P5L+Z+LfBXY0ZcNI1Z
 v3oNnv4EEX97IXG2608I4S7bLQpI9LH6+4F5/X+TlbBSX+6TNtgTisKDMXJQ3AGj
 kDQQ1CM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=content-type
 :message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to; q=dns; s=default; b=nahqEhwKBXcWnas4LzBtoAeijIrjnO
 EpA9zFJXlRNUvSfKZ2gqjKWGEiQ9onWhL9JzMBEstMZZXA2xjJtiXYVjb9bq+lfw
 UOvSG0klaOfF47MiNaNDBV3HVfHNqUUjAH++IR+qFjPhlQornxm+Xzzm43yLQNLX
 6iEcFaRJ6Eh/M=
Received: from [IPV6:2001:470:b050:6:cc31:46d5:f26a:a82b] (unknown
 [IPv6:2001:470:b050:6:cc31:46d5:f26a:a82b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4ZvRNv3scwz8PbN;
 Fri,  9 May 2025 20:21:03 -0400 (EDT)
Content-Type: multipart/alternative;
 boundary="------------M9hUlm031KXwCVsM4pS7Cb1h"
Message-ID: <42058c82-8981-4040-82b5-ea190acc5460@comstyle.com>
Date: Fri, 9 May 2025 20:21:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] Revert "meson.build: Disable -fzero-call-used-regs on
 OpenBSD"
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250508093519.144004-1-thuth@redhat.com>
 <20250508093519.144004-6-thuth@redhat.com> <aByB5B02zxvUZo7P@redhat.com>
Content-Language: en-US
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <aByB5B02zxvUZo7P@redhat.com>
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-TUID: fbqHcYBXo9kf

This is a multi-part message in MIME format.
--------------M9hUlm031KXwCVsM4pS7Cb1h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2025-05-08 6:05 a.m., Daniel P. Berrang=C3=A9 wrote:
> On Thu, May 08, 2025 at 11:35:19AM +0200, Thomas Huth wrote:
>> From: Thomas Huth<thuth@redhat.com>
>>
>> This reverts commit 2d6d995709482cc8b6a76dbb5334a28001a14a9a.
>>
>> OpenBSD 7.7 fixed the problem with the -fzero-call-used-regs on OpenBS=
D,
>> seehttps://github.com/openbsd/src/commit/03eca72d1e030b7a542cd6aec1 fo=
r
>> the fix there.
> Is that fix also backported to OpenBS 7.6 ?
>
> We support the 2 most recent releases of each platform, so for OpenBSD
> thats currently 7.6 and 7.7.
>
> If it wasn't backported to 7.6, we must wait until 7.8 before we can
> rely on the fix being present.

I was under the impression it was only 1.

Oh well. Just means waiting until end of Oct for the next release.

--------------M9hUlm031KXwCVsM4pS7Cb1h
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-05-08 6:05 a.m., Daniel P.
      Berrang=C3=A9 wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:aByB5B02zxvUZo7P@redhat.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Thu, May 08, 2025 at 11:3=
5:19AM +0200, Thomas Huth wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">From: Thomas Huth <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:thuth@redhat.com">&lt;thuth@red=
hat.com&gt;</a>

This reverts commit 2d6d995709482cc8b6a76dbb5334a28001a14a9a.

OpenBSD 7.7 fixed the problem with the -fzero-call-used-regs on OpenBSD,
see <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbsd=
/src/commit/03eca72d1e030b7a542cd6aec1">https://github.com/openbsd/src/co=
mmit/03eca72d1e030b7a542cd6aec1</a> for
the fix there.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Is that fix also backported to OpenBS 7.6 ?

We support the 2 most recent releases of each platform, so for OpenBSD
thats currently 7.6 and 7.7.

If it wasn't backported to 7.6, we must wait until 7.8 before we can
rely on the fix being present.</pre>
    </blockquote>
    <p>I was under the impression it was only 1.<br>
      <br>
      Oh well. Just means waiting until end of Oct for the next release.<=
span
      style=3D"white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------M9hUlm031KXwCVsM4pS7Cb1h--
