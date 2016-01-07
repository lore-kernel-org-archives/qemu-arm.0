Received: by 10.182.158.201 with SMTP id ww9csp451415obb;
        Thu, 7 Jan 2016 00:50:22 -0800 (PST)
X-Received: by 10.194.192.198 with SMTP id hi6mr113532365wjc.141.1452156622793;
        Thu, 07 Jan 2016 00:50:22 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com. [2a00:1450:400c:c09::234])
        by mx.google.com with ESMTPS id i2si62019599wja.89.2016.01.07.00.50.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2016 00:50:22 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::234 as permitted sender) client-ip=2a00:1450:400c:c09::234;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::234 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x234.google.com with SMTP id f206so88644875wmf.0
        for <alex.bennee@linaro.org>; Thu, 07 Jan 2016 00:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=ydqgVhJ536YyzWTuYHJWQPTwkgRG3qct+T0sPuPcBm8=;
        b=gAztjEgAiWGSBTFLHZDRGtXT2LAaEpjX6UC6EvVpRWFJGrqcQy0Ypr04Ia3nySxSaS
         IhGvDG8Gi2yfczbbAJOgwJjqvozB7NlQPhVZbZdibmAHwNgS/0XAyDGHHNqcA8l4jbbx
         IBUz/3mMnURtBn1Rgg0nNkMSiKI+UXrNnrnvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=ydqgVhJ536YyzWTuYHJWQPTwkgRG3qct+T0sPuPcBm8=;
        b=ljD6RhQGo1d5Xrax1zPz/9gpShDQ4FeuID/UGPlWdb5B3ZNewHKv4dOe6cKHcdCfmM
         cV/uGWvqjLJ9wNvU9J2ywEtvpG1HBbLZGYtw2jpuxox3IW0pmG1d6LUBMf+ffxEvomOa
         Z+ZpCTPZAUAqt3qbpd8EG3GzwvCJ3A99l7u7zO3OrBoQXqrD3P+vqrt04aGbT6nYhvGe
         c81lGCK5wjXTygxi/OwRH70HyOUdIRfVw8lVKJIA5gF6cVXlt0AeaNSbMv8h6Vc9q0m9
         sJN3ApGuup0T2nKj2TSu0pQ9zwQF1Zvmr/xWgYWtPMvgofzM0jfUeHimbI5zE8jjSW4j
         4CiA==
X-Gm-Message-State: ALoCoQmFOQkVtg5s173RBN9DDLzrBz2uaWDHyLWg93vj6MrHXuXeg4HI09/9fKxkb5GOFq8JKQJqcAcXCKUm4+8c1FLeE7+pfg==
X-Received: by 10.28.45.10 with SMTP id t10mr16111975wmt.12.1452156622487;
        Thu, 07 Jan 2016 00:50:22 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id q4sm100231882wja.6.2016.01.07.00.50.20
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 07 Jan 2016 00:50:21 -0800 (PST)
Subject: Re: [PATCH v2 4/7] device_tree: qemu_fdt_getprop converted to use the
 error API
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
 <1452093205-30167-5-git-send-email-eric.auger@linaro.org>
 <CAPokK=qiRjZa4SsTHhT-jfv3CxS7uvKJBgJPDjScwp72ASAHsg@mail.gmail.com>
Cc: eric.auger@st.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, thuth@redhat.com,
 Patch Tracking <patches@linaro.org>,
 Christoffer Dall <christoffer.dall@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, b.reynal@virtualopensystems.com,
 suravee.suthikulpanit@amd.com, thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <568E26C3.1070602@linaro.org>
Date: Thu, 7 Jan 2016 09:50:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=qiRjZa4SsTHhT-jfv3CxS7uvKJBgJPDjScwp72ASAHsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: je0x5TuPW/Je

Hi Peter,
On 01/07/2016 01:20 AM, Peter Crosthwaite wrote:
> On Wed, Jan 6, 2016 at 7:13 AM, Eric Auger <eric.auger@linaro.org> wrote:
>> Current qemu_fdt_getprop exits if the property is not found. It is
>> sometimes needed to read an optional property, in which case we do
>> not wish to exit but simply returns a null value.
>>
>> This patch converts qemu_fdt_getprop to accept an Error **, and existing
>> users are converted to pass &error_fatal. This preserves the existing
>> behaviour. Then to use the API with your optional semantic a null
>> parameter can be conveyed.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>>
>> ---
>>
>> v1 -> v2:
>> - add a doc comment in the header file
>>
>> RFC -> v1:
>> - get rid of qemu_fdt_getprop_optional and implement Peter's suggestion
>>   that consists in using the error API
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>> ---
>>  device_tree.c                | 11 ++++++-----
>>  include/sysemu/device_tree.h | 15 ++++++++++++++-
>>  2 files changed, 20 insertions(+), 6 deletions(-)
>>
>> diff --git a/device_tree.c b/device_tree.c
>> index 8441e01..6ecc9da 100644
>> --- a/device_tree.c
>> +++ b/device_tree.c
>> @@ -321,18 +321,18 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
>>  }
>>
>>  const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>> -                             const char *property, int *lenp)
>> +                             const char *property, int *lenp, Error **errp)
>>  {
>>      int len;
>>      const void *r;
>> +
>>      if (!lenp) {
>>          lenp = &len;
>>      }
>>      r = fdt_getprop(fdt, findnode_nofail(fdt, node_path), property, lenp);
>>      if (!r) {
>> -        error_report("%s: Couldn't get %s/%s: %s", __func__,
>> -                     node_path, property, fdt_strerror(*lenp));
>> -        exit(1);
>> +        error_setg(errp, "%s: Couldn't get %s/%s: %s", __func__,
>> +                  node_path, property, fdt_strerror(*lenp));
>>      }
>>      return r;
>>  }
>> @@ -341,7 +341,8 @@ uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>>                                 const char *property)
>>  {
>>      int len;
>> -    const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len);
>> +    const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len,
>> +                                         &error_fatal);
> 
> The _cell variant is now inconsistent with the regular _getprop. Can
> we convert them both together and fix the clients to error_fatal?
> (there are only 4 of them).

Yes sure

Best Regards

Eric
> 
> This would become the standard error_propagate pattern.
> 
>>      if (len != 4) {
>>          error_report("%s: %s/%s not 4 bytes long (not a cell?)",
>>                       __func__, node_path, property);
> 
> And this would also convert to error_setg.
> 
> Regards,
> Peter
> 
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index 269cb1c..4d7cbb9 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -45,8 +45,21 @@ int qemu_fdt_setprop_string(void *fdt, const char *node_path,
>>  int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>>                               const char *property,
>>                               const char *target_node_path);
>> +/**
>> + * qemu_fdt_getprop: retrieve the value of a given property
>> + * @fdt: pointer to the device tree blob
>> + * @node_path: node path
>> + * @property: name of the property to find
>> + * @lenp: fdt error if any or length of the property on success
>> + * @errp: handle to an error object
>> + *
>> + * returns a pointer to the property on success and NULL on failure
>> + * in case errp is set to &error_fatal, the function auto-asserts
>> + * on error (legacy behavior)
>> + */
>>  const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>> -                             const char *property, int *lenp);
>> +                             const char *property, int *lenp,
>> +                             Error **errp);
>>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>>                                 const char *property);
>>  uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>> --
>> 1.9.1
>>
