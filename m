Received: by 10.28.91.67 with SMTP id p64csp816108wmb;
        Fri, 9 Mar 2018 05:54:13 -0800 (PST)
X-Received: by 10.157.44.39 with SMTP id f36mr19828963otb.95.1520603653273;
        Fri, 09 Mar 2018 05:54:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520603653; cv=none;
        d=google.com; s=arc-20160816;
        b=E4msNuumhLHtTU9xQfbBnV8FmZAfBq2v++y2/3pHRxIXTVDgVuLUx2wnAgBzq/wt+B
         BZpxtG4q6xfzOFShA4mNDs3acoNKeXg0Nr4/UTv3q6DQSfSmhLE+/E4tqIvqcxq4YuiO
         Y0bK2VnOu8ZpznolhayoKsTce/f/sZJbONlSZeOK9MB5AUxdr+qVyTOiIpOaihte73f6
         FVb/qg4aRBOXVBtBUKpKGcuoUc/CTfnHFVTNaP+UsLFHX1U2xkYI49cc2d84l1w19yYi
         izRyDXo4z3u3HlpWGkysEWdgIcpWhTDPkjf3aEZ0rS0NQoFY/+rDsBat7TYpNyrs9/zr
         dIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vcn3bdRhIrmr+7CYcTYVAde6NTEuWk7z/Lw0wPhT72E=;
        b=B3iVeaorsK4lzfufl+HJqbhdAM2XTOlYKB/Ga+TfGlbcnZWoQPBjwF0mE9UTl25/as
         hQ4R6vDaEn72ERViPt9UpVrPP4B3eg8Vk0tqMTX7x7y2MYSjl8JlwYOpLCw08MCgC5Pv
         u/HKVPfespBTBNBvW82YMAWwwHN5dAxGzaA4VqmnfolCDJ5cWiohB/90Jy6H2PZ1b9Kx
         316cpvb0+tN7F4I7iQQffo6norafGA5pu5kY05HTw/AsjA6qcT9xvmM0yP/RK5GjOW0x
         ZHs+/s5vWRyuN1Anp3pP5WzMbVc7zszbQDRgc9Va+G1srz8hPEuLTjs2GnHGR6EW7eEw
         pNyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ReKpNDxg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x144sor441211oif.295.2018.03.09.05.54.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Mar 2018 05:54:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ReKpNDxg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vcn3bdRhIrmr+7CYcTYVAde6NTEuWk7z/Lw0wPhT72E=;
        b=ReKpNDxgoGH+yZGILto7za9MXEXR23eA1PgKwPWQ6OLq0nmJTil3NXJKwLX7jT0oYi
         sTBhU4ww/Kl6p7jnHDd1S0DhcBTd5WdEQHgWjqHLXRYU4lqNNOyIODVr8l8+u0xqdhoe
         PRpyLYyjPM+erXAvXjd6Dfsp0eSqZTcR8AuaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vcn3bdRhIrmr+7CYcTYVAde6NTEuWk7z/Lw0wPhT72E=;
        b=UrPmnIDI+LvwHqkg9Z29lp/F7Nq+yqKJAimtvp1WayRXQCy6Upq5wcsXBlh7rGnzIi
         1FmAC1W+Va2fpj3O6d1M1e+B9iPNIuKEBwBU9MdbJ/56u77JEmg6RFaZ2/9ZXPc6blfJ
         /2lxBSneO8Ev4AUyhFEtJh2C4bQlP/FDa2q6K2d4uqw0F5Sbh4Tq45KY9Dnjk3FT5ErW
         6cavTit3roeOzym00oryIsxGsEBcsvOvQBSDTaFOd4nrVprhlvIVyzxg0oLNEOtMjFSr
         SGGRzhotIZEwFX51wQwzJoPO5P2zuq1xqkKEqbwO8eqE3eoHs6SgW6NrcMNzKbz60I14
         bOdA==
X-Gm-Message-State: APf1xPCxeFJo0zYpHv8ND7sUNbO2mJ4HSSYshwqMwwMIK2VTMKuR++5J
	qUJ8n0Kmb7dRzOSxqchUa4KtbeB9McYAkt+8NwX9JMcz89A=
X-Google-Smtp-Source: AG47ELtUUqlWQTnaFKeP/259ts+5ZGk8gozv18Quc0/JnbUXWRKWkT1jYE/SfIipXWiONxJ/NPBvJraZk7q0YgN0ZC0=
X-Received: by 10.202.95.68 with SMTP id t65mr19938282oib.102.1520603652764;
 Fri, 09 Mar 2018 05:54:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Fri, 9 Mar 2018 05:53:52 -0800 (PST)
In-Reply-To: <871sgtl5o0.fsf@linaro.org>
References: <20180308130626.12393-1-peter.maydell@linaro.org>
 <20180308130626.12393-7-peter.maydell@linaro.org> <871sgtl5o0.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Mar 2018 13:53:52 +0000
Message-ID: <CAFEAcA-JDyRPy1MiCf49+0W3VVgn3O6wWN=8v22Kpc+e7bRN9A@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] hw/arm/virt: Support -machine gic-version=max
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Igor Mammedov <imammedo@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: fjj2vCqAWepI

On 9 March 2018 at 13:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>> @@ -1480,9 +1487,11 @@ static void virt_set_gic_version(Object *obj, con=
st char *value, Error **errp)
>>          vms->gic_version =3D 2;
>>      } else if (!strcmp(value, "host")) {
>>          vms->gic_version =3D 0; /* Will probe later */
>> +    } else if (!strcmp(value, "max")) {
>> +        vms->gic_version =3D -1; /* Will probe later */
>>      } else {
>>          error_setg(errp, "Invalid gic-version value");
>> -        error_append_hint(errp, "Valid values are 3, 2, host.\n");
>> +        error_append_hint(errp, "Valid values are 3, 2, host,
>> max.\n");
>
> nit: host is only valid on aarch64 host. However it will fail later on
> with:
>
>   qemu-system-aarch64: gic-version=3Dhost requires KVM

'host' was already in this string. It's valid in the sense that
it's not a syntax error, though it won't work in all situations.
(Similarly, if you try '3' and you have KVM enabled and a gicv2
host system you'll get an error.)

thanks
-- PMM
