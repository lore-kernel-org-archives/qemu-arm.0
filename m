Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1817711wrt;
        Thu, 10 Jan 2019 05:27:44 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5/SppABzVFHYO057tj8ZfTbpaEEOxUIPWESKBCOe54Cpn6ccCjrNesLLegsvCOyHimJMdy
X-Received: by 2002:a62:824c:: with SMTP id w73mr10180841pfd.150.1547126864896;
        Thu, 10 Jan 2019 05:27:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547126864; cv=none;
        d=google.com; s=arc-20160816;
        b=zSzu3N1Zn8tuBuL8NWtizhAhe1YV8MpIMM64vIcB/MInK0gBCuDKqf0xw/L6aTwGZT
         jbHxsn+pE00Qy/CBO/09zIgeJ3tmjd/ElZiNvsCLa9YiJqzRl1uIbS16eMvTgauJ3MiI
         N9obDptQdqWSCEgR1yIbOKsRxSK0+tEh5yvW+0+v6ZIdCPHsRfGsSkBXv+pVx4Vf5suY
         9X0yTJX52o0qqx3DZrT+ayCUtVpnspP+C7g9jJlTCJfjrot0TFtZ9iNN257eF//xJGMn
         DF7NZ4GUtZ9eEpPoZcoqhWwZKfWr2vBwMTOKJAy1JACrhPuEwpe2IctALEcpVb0z7UMz
         FpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XHLRUT7xo0iN1vh+bW4Q5zukEI/zBKolz2eo3P3CxGM=;
        b=HwimSGAQzorSoIN2VGmlmhecjUFpWL44hj1sFuSmpgwUIghPOF4pVwtUnT/+cGmoDs
         KISuxW1P4FzeVrlunozZfsDxOsD8G6DbbAhIfL0uV7aNIGqprEi5SmkDNt4ZPvR4J3Sq
         BV65rJrjOgtmsoovzh2HN+UXX/OuMyXnOeNpomlnzqwXhTjm6RPejks/sAbIk34qqMLd
         ywrBRRJ0KdbGWWD2j1UK6JLhRxzjGovWllzelIzGobi/VrrdZvF8ZWLxGBDPrxtgmCF0
         VEH+7Rux3uGxhU+ebCqXR9fEnRSlXnlUTiXP7k4w7JQeC9lowULjDb4Du476vvAg0MtQ
         1cQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMjWkNNj;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id u2si69845029pgo.544.2019.01.10.05.27.44;
        Thu, 10 Jan 2019 05:27:44 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMjWkNNj;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbfAJN1n (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 10 Jan 2019 08:27:43 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44025 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbfAJN1n (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 10 Jan 2019 08:27:43 -0500
Received: by mail-oi1-f196.google.com with SMTP id u18so9235329oie.10
        for <kvm@vger.kernel.org>; Thu, 10 Jan 2019 05:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XHLRUT7xo0iN1vh+bW4Q5zukEI/zBKolz2eo3P3CxGM=;
        b=WMjWkNNjUIxES8P7rLBVX3B+8AH6W2AQKsBQWw5n90mTaGzmjiGPmd8lVXpERxFNvR
         oIuJu7hNgeP9Ih8SiA/+YqyQvI7kNboqllrWyqYz/jwGpxFCkq69xR1OwyQ7Bk2CxSrH
         DGDHV+thKBXt4wNsmLcvFrkYVj2CwyRe0m9os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XHLRUT7xo0iN1vh+bW4Q5zukEI/zBKolz2eo3P3CxGM=;
        b=dVhYVUj9ghfKTzGPceWJBNywhJ1Y5sDM/AGjgp9gYtJxHqg2biwzJI8FjUnUndRrcu
         UYpqyGl6uLcmlXnIac2BfS9VwFted5gNKKAxWN0T4a6ARaIc79CJDdnjDSyaNI3bFUlh
         f0ewnjqNc05PgWHYSeHbUhkgDMSWnktl2DRzd3ldNDR+PDbZEPIA2OdDeXln75L0Wn/T
         7Nb4ikmDiiI4a/4Y3yyLvKTDkOgOt0a6cKl/D+zWZMmcNFWeuTTuCD/pVoJjJhdRDkOY
         hKHw4L3auRNcPub6BeJ3MvZYMf4P88rbNrZmnN/AtAnEYGaCJcDb076I0O/IyT1rrlRW
         hcDg==
X-Gm-Message-State: AJcUukd4BXj8V/g06lPJVwmxSw6OAcCqNsBLMAeJaE7o6NtbCoUuvT2w
        Lhp/CkAujcbsmG24mJVTuGgRodwcUaO2L/7nRpkUZQ==
X-Received: by 2002:aca:5c05:: with SMTP id q5mr6255414oib.146.1547126862428;
 Thu, 10 Jan 2019 05:27:42 -0800 (PST)
MIME-Version: 1.0
References: <1541672153-15529-1-git-send-email-gengdongjiu@huawei.com> <1541672153-15529-11-git-send-email-gengdongjiu@huawei.com>
In-Reply-To: <1541672153-15529-11-git-send-email-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 10 Jan 2019 13:27:31 +0000
Message-ID: <CAFEAcA_toKXMDAcjTseB2WquCXkEKqh=GODiG1-tEUa32xy2bQ@mail.gmail.com>
Subject: Re: [PATCH v15 10/10] target-arm: kvm64: handle SIGBUS signal from
 kernel or KVM
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: bZ8T+QO8xd5E

On Thu, 8 Nov 2018 at 10:18, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
> Add SIGBUS signal handler. In this handler, it checks the SIGBUS type,
> translates the host VA delivered by host to guest PA, then fill this PA
> to guest APEI GHES memory, then notify guest according to the SIGBUS type.
> There are two kinds of SIGBUS that QEMU needs to handle, which are
> BUS_MCEERR_AO and BUS_MCEERR_AR.

> +bool ghes_record_errors(uint32_t notify, uint64_t physical_address)
> +{
> +    uint64_t error_block_addr, read_ack_register_addr;
> +    int read_ack_register = 0, loop = 0;
> +    uint64_t start_addr = le32_to_cpu(ges.ghes_addr_le);
> +    bool ret = GHES_CPER_FAIL;
> +    const uint8_t error_source_id[] = { 0xff, 0xff, 0xff, 0xff,
> +                                        0xff, 0xff, 0xff, 0, 1};
> +
> +    /*
> +     * | +---------------------+ ges.ghes_addr_le
> +     * | |error_block_address0|
> +     * | +---------------------+
> +     * | |error_block_address1|
> +     * | +---------------------+ --+--
> +     * | |    .............    | GHES_ADDRESS_SIZE
> +     * | +---------------------+ --+--
> +     * | |error_block_addressN|
> +     * | +---------------------+
> +     * | | read_ack_register0  |
> +     * | +---------------------+ --+--
> +     * | | read_ack_register1  | GHES_ADDRESS_SIZE
> +     * | +---------------------+ --+--
> +     * | |   .............     |
> +     * | +---------------------+
> +     * | | read_ack_registerN  |
> +     * | +---------------------+ --+--
> +     * | |      CPER           |   |
> +     * | |      ....           | GHES_MAX_RAW_DATA_LENGT
> +     * | |      CPER           |   |
> +     * | +---------------------+ --+--
> +     * | |    ..........       |
> +     * | +---------------------+
> +     * | |      CPER           |
> +     * | |      ....           |
> +     * | |      CPER           |
> +     * | +---------------------+
> +     */
> +    if (physical_address && notify < ACPI_HEST_NOTIFY_RESERVED) {

Why is a zero physical address special here? Shouldn't we be
able to report "the memory backing physaddr 0 has a fault" ?

thanks
-- PMM
