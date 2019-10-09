Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1261621wrm;
        Wed, 9 Oct 2019 11:21:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZaDM8mtBHGDr6hBNT4Zzr8dmEQK99fjbnaKt1zgFCo8vSHS1grv7JdOyUXsXEMLb+7DuS
X-Received: by 2002:a17:906:fcac:: with SMTP id qw12mr4101171ejb.31.1570645281683;
        Wed, 09 Oct 2019 11:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570645281; cv=none;
        d=google.com; s=arc-20160816;
        b=lvdScX50ftKsv4pfuud34v2GKpYpVXxP3JL8mF1719miUSrJLi+fBh1H43Bv1X8kjc
         v3x44dr8M7tGzqr8S/S/ej6ZFR2Hn/m/bcbsBco5t6U9ZM2exejWpKrGZMPeEAmkFB8Y
         lyUMfv/doFOV9GS2cFvOL8OcAkwu4KDgxcACqyLc9Ypf2fK8YWok0VmEV/FGstj7OJ7J
         CbDTqVKYxh8lTCcLTJrfI7JWKhlM4ZkvDnFuJaj+pMe6CXbG3CKwaBXNFOvID9o9+rNN
         Taed3hPZtqfePmrO3fw+oHd8uAZ2hFYs+HWSbXk68HOTYMoAxxDbcUG1/GzYE3seY78F
         IJ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RV4BW2Rul1SJvLbGnsvPDgNULkZjIYo7yp+xwh6MfbQ=;
        b=AG6ff4uaTfHU0kr4DbW7snlQnUoNpC7C05A/H3hGJDSEpABlKjK9miSJpFFOzB9wyE
         xG2XvWhRVvVKOdN6SP+uYTw3NR2FiQX/B1QLfxsesNybQ+G0DeCn9OqcB0BvDwljf/aX
         P9gjunHFDun7g2eLaadQOIvRqQTOWkYr0jcIo65osZdosyflrTqze6xqhPIk9SBcp19S
         yRe2zsv8rpYnawJLdZ5a2JHDl60QjnG0rC0bwX+IS0p5J5f0dsriYBre/g4OQEGnrobw
         lPYEZPbzI9qwjavmEgrdwdaGO5+Ww3U1ERYAR6N8BQOuLiVHilULs7Wm4mI7YXFuS9qI
         5vng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KC8R8vOT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ns21si1556343ejb.167.2019.10.09.11.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 11:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KC8R8vOT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIGaO-0008Eq-B3
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 14:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iIAPm-0001HB-KE
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 07:45:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iIAPk-0004BX-Hk
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 07:45:58 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:43944)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iIAPk-000441-Cm
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 07:45:56 -0400
Received: by mail-io1-xd44.google.com with SMTP id v2so4180832iob.10
 for <qemu-arm@nongnu.org>; Wed, 09 Oct 2019 04:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RV4BW2Rul1SJvLbGnsvPDgNULkZjIYo7yp+xwh6MfbQ=;
 b=KC8R8vOTKBcfyuI9fRqTnAaEg2TBr9H6W5ltiHVJ8dQyMiWynYetcUr/feR9G7dAAf
 YN1vqmHMRZrHauFjHjhJr+W9B4PsC5tCp+l65DHSOkuoDc4KUOMc6I82ZYQicIFlJynx
 u7r1x1jgs+KzhFQg59WzgBHE82GCKWcChAyUK/SZtOQEyYAzrOC8I++tVA0AVcGeVxEa
 HwXBTyI9fqoIkgorPCu7Tsl3sPamxW7bMhFoHmiIJeu0kLiuiokLwCxmKGZTSDQyWZW/
 0ms3UxjjSQC0QjiCGM0UDWzoU8aUJ+MEfTQ9RDP+dXmO/xTpvHJ9cx1rknmkX0ndL4JT
 GjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RV4BW2Rul1SJvLbGnsvPDgNULkZjIYo7yp+xwh6MfbQ=;
 b=g6rrOs1NWJ2IWrpa+3Hy3Vaw1eRn2ilSmoEaahW9lohdA5MpCD4TtKJi7HStGr8S1m
 eWQKDU4lRBHy+re49dr79q7rXNjDEb878/lZcbsRnPqxbkPOWQLraEOBiZqQXpufxg67
 bTuD7ZSGPNxe7EfATlTaghA2UNjZl3ToCHMqiWOgNc9AQPdXucankURz738NH/FygbU3
 D4eLRG5lCbWVrf+SHQ+zmYgelfuLO9CyFVTCSuAqxMXOKv/vMBwQcgQF24Iee1Fxm5oU
 aflPtHrDADkab8aA8flxmSriRVlcWpUFdFIQ2gU9NIQ1DpcuANphUwVam62n6Umwphs6
 S+EQ==
X-Gm-Message-State: APjAAAU53EaIFHewlhb5uHVk6rJrOdKTP6bxKVyWJDtZ+Tqr6cNw9u6V
 aSStubWs1y7NS/NS6vPIeEElBpbOAeEudD1eS7BIfQ==
X-Received: by 2002:a92:2406:: with SMTP id k6mr2949553ilk.260.1570621553097; 
 Wed, 09 Oct 2019 04:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-3-beata.michalska@linaro.org>
 <e5e66d9c-16ee-a700-7608-69ec19c32b47@linaro.org>
In-Reply-To: <e5e66d9c-16ee-a700-7608-69ec19c32b47@linaro.org>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Wed, 9 Oct 2019 12:45:42 +0100
Message-ID: <CADSWDzsf8=0q0bUH1iLdQ+rNgu3TU2Ee3QddhDZN5nBhH7yDSA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 2/4] Memory: Enable writeback for given
 memory region
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
Cc: Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 shameerali.kolothum.thodi@huawei.com, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ApdpPKkXorxA

On Tue, 24 Sep 2019 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/10/19 2:56 AM, Beata Michalska wrote:
> > +void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t length);
> > +
> > +/* Clear whole block of mem */
> > +#define qemu_ram_block_writeback(rb)    \
> > +    qemu_ram_writeback(rb, 0, rb->used_length)
> > +
>
> Inline function, with its typechecking, is preferred.
>
>
Noted.
To be fixed in the next version.

BR
Beata
> r~
